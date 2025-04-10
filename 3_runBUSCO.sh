#!/bin/bash -l        
#SBATCH --time=12:00:00
#SBATCH --ntasks=100
#SBATCH --mem=400g
#SBATCH --tmp=300g
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=youremail


module load  busco

cd path/to/your/dir



busco  -i Genome_masked_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_GENOME1 -m genome

