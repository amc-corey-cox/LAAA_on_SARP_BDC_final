#!/bin/bash

zip_password=W1w6VgdSWsyqCr

for ((chr=1; chr<=22; chr++)); do
    7z e chr_${chr}.zip -y -p$zip_password
done
