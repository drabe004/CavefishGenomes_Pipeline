#!/bin/bash -l        
#SBATCH --time=96:00:00
#SBATCH --ntasks=120
#SBATCH --mem=500g
#SBATCH --tmp=300g
#SBATCH -p astyanax
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=drabe004@umn.edu
#SBATCH --job-name=fun2


cd /panfs/roc/groups/14/mcgaughs/drabe004/Funnannote_Full

module unload impi

module load  funannotate/incomplete.1.8.5

export PATH=$PATH:/panfs/roc/groups/14/mcgaughs/drabe004/Actinopteriigii_BUSCO_DB/


funannotate predict --cpus 20 -i /panfs/roc/groups/14/mcgaughs/drabe004/NewGenomes/MBRI/MBRI_masked_out/MBRI_Rmasked_sorted.fasta \
 --species "Mastacembelus brichardi" --max_intronlen 50000 --repeats2evm \
 --busco_seed_species zebrafish --organism other --busco_db actinopterygii --optimize_augustus --force  -o output_fun_MBRI8