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
zip_password=W1w6VgdSWsyqCr

for ((chr=1; chr<=22; chr++)); do
    if [[ -f chr${chr}.dose.vcf.gz ]]; then
        continue;
    fi
    ./7za e chr_${chr}.zip -y -p$zip_password
done
