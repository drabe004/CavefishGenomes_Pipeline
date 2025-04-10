#!/bin/bash -l        
#SBATCH --time=01:00:00
#SBATCH --ntasks=2
#SBATCH --mem=50g
#SBATCH --tmp=10g
#SBATCH --mail-type=ALL  
#SBATCH --mail-user=drabe004@umn.edu 




module load python
module load orthofinder

cd /panfs/roc/groups/14/mcgaughs/drabe004/MASTER_FISH_PROTS

python

for f in *fa ; do python /panfs/roc/groups/14/mcgaughs/drabe004/MASTER_FISH_PROTS/primary_transcript.py $f ; done
