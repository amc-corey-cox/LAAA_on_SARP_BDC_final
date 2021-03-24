#!/bin/bash

zip_password=W1w6VgdSWsyqCr

for ((chr=1; chr<=22; chr++)); do
    if [[ -f chr${chr}.dose.vcf.gz ]]; then
        continue;
    fi
    ./7za e chr_${chr}.zip -y -p$zip_password
done
