#!/bin/bash -l        
#SBATCH --time=12:00:00
#SBATCH --ntasks=100
#SBATCH --mem=400g
#SBATCH --tmp=300g
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=drabe004@umn.edu
#SBATCH --job-name=BUSCO

module load  busco

cd /panfs/jay/groups/26/mcgaughs/drabe004/BUSCO

##busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes -l actinopterygii_odb10 -o BUSCO_OUT -m genome
##Batch mode isnt working I don't know why

#busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/Japlin1.1_sorted.fasta  -l actinopterygii_odb10 -o BUSCO_OUT_Japlin -m genome

#busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/MBRI_Rmasked_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_MBRI -m genome

#busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/Molino6_11_Jan19_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_Molino -m genome

#busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/NTROG_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_NTROG -m genome

#busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/OPIN_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_OPIN -m genome

#busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/Prietella_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_Prietella -m genome

#busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/RAMA_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_RAMA -m genome

#busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/Rascon3B_24_Jan19_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_Rascon -m genome

#busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/RHLA_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_RHLA -m genome

#busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/RHRE_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_RHRE -m genome

#busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/RHZO_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_RHZO -m genome

#busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/SKAY_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_SKAY -m genome

busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/SMIC2_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_SMIC -m genome

busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/Soed_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_SOED -m genome

busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/SSPI_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_SSPI -m genome

busco  -i /panfs/jay/groups/26/mcgaughs/drabe004/NewGenomes/TYPE_sorted.fasta -l actinopterygii_odb10 -o BUSCO_OUT_TYPE -m genome

