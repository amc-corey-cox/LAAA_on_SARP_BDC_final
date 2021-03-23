#!/bin/bash

chr=$1
echo "Processing chromosome $chr ..."
./bcftools view -S SARP.txt "/Volumes/Promise Pegasus/dbgap_downloads/78082/topmed-dcc/exchange/phs001446_TOPMed_WGS_SARP/Combined_Study_Data/Genotypes/freeze.8/phased/freeze.8.chr${chr}.pass_only.phased.bcf" | bgzip -c > "/Volumes/Promise Pegasus/topmed_freeze8_phased_sarp/chr${chr}.vcf.gz"
tabix "/Volumes/Promise Pegasus/topmed_freeze8_phased_sarp/chr${chr}.vcf.gz"
