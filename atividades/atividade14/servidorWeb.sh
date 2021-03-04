#!/bin/bash

KEY_PAIR=$1
SG_NAME="${2:-web-sg}"
PROFILE="${3:-default}"

# create security group
SG_EXISTS=$(aws ec2 describe-security-groups --profile $PROFILE  \
    --filters Name=group-name,Values=$SG_NAME \
    --query "SecurityGroups[*].GroupName" --output text
)
if [ -z $SG_EXISTS ]
then
    SG_ID=$(aws ec2 create-security-group --profile $PROFILE  \
        --group-name $SG_NAME --description "Ports 80 and 22" --query "GroupId" --output=text
    )
fi

# add permissions to security group
PORTS=$(aws ec2 describe-security-groups --profile $PROFILE  \
    --filters Name=group-name,Values=$SG_NAME \
    --query "SecurityGroups[*].IpPermissions[*].FromPort" --output text | sed 's/\t/:/g'
)
PORTS=(${PORTS//:/ })

if ! [[ " ${PORTS[@]} " =~ " 80 " ]]; then
    aws ec2 authorize-security-group-ingress --profile $PROFILE --group-name $SG_NAME --protocol tcp --port 80 --cidr 0.0.0.0/0
fi

if ! [[ " ${PORTS[@]} " =~ " 22 " ]]; then
    aws ec2 authorize-security-group-ingress --profile $PROFILE --group-name $SG_NAME --protocol tcp --port 22 --cidr 0.0.0.0/0
fi

# run instance
INSTANCE=$(aws ec2 run-instances --profile $PROFILE \
    --image-id ami-042e8287309f5df03 --count 1 --instance-type t2.micro \
    --key-name $KEY_PAIR --security-group-ids web-sg --user-data file://user_data.txt \
    --query "Instances[*].InstanceId" --output=text
)

# wait for instance creation
STATUS=
while [ "$STATUS" != "ok" ]
do
    echo "Criando servidor..."
    sleep 30
    STATUS=$(aws ec2 describe-instance-status --instance-id $INSTANCE --profile $PROFILE \
        --query "InstanceStatuses[0].SystemStatus.Status" --output=text
    )
done

# get instance ip
IP=$(aws ec2 describe-instances --profile $PROFILE \
    --instance-id $INSTANCE \
    --query "Reservations[*].Instances[*].PublicIpAddress" --output=text
)
echo Acesse: http://$IP/
