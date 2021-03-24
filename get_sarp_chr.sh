#!/bin/bash
#SBATCH -p c2s4
#SBATCH --job-name=hpc_tmp
#SBATCH --out=hpc_tmp.log
#SBATCH --error=hpc_tmp.err

# These lines generally make bash shell scripts safer
set -euo pipefail        # -e: exit on any error, -u: treat unset variables as error
IFS="`printf '\n\t'`"    # split words only on \n and \t, not space (improves loops)

# Uncomment this for better logging
set -x # Print each command after variable exansion

# Begin main script
data_dir="/Volumes/Promise Pegasus/dbgap_downloads/78082/topmed-dcc/exchange/phs001446_TOPMed_WGS_SARP/Combined_Study_Data/Genotypes/freeze.8/phased/"
out_dir="/Volumes/Promise Pegasus/topmed_freeze8_phased_sarp/"

minsize=100
for chr in {19,16,11,9,8,1}; do
  echo "Processing chromosome $chr ..."
  # size=$(stat -f%z "${out_dir}/chr${chr}.vcf.gz")

  # if (( size > minsize )); then
  #   echo "Skipping chr $chr appears to be extracted"
  #   continue
  # fi

  # echo ./bcftools view -S SARP.txt "${data_dir}/freeze.8.chr${chr}.pass_only.phased.bcf"
  # echo bgzip -c "${out_dir}/chr${chr}.vcf.gz"

  ./bcftools view -S SARP.txt "${data_dir}/freeze.8.chr${chr}.pass_only.phased.bcf" |\
    bgzip -c > "${out_dir}/chr${chr}.vcf.gz"

  # echo tabix "/Volumes/Promise Pegasus/topmed_freeze8_phased_sarp/chr${chr}.vcf.gz"

  tabix "/Volumes/Promise Pegasus/topmed_freeze8_phased_sarp/chr${chr}.vcf.gz"
done 
