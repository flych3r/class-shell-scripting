#!/bin/bash
# Correção: OK. 1,0 Ponto.

mkdir maiorque10
find . -type f -size +10M -exec mv -t maiorque10/ {} +
tar -czvf maiorque10.tar.gz maiorque10/
rm -rf maiorque10/
