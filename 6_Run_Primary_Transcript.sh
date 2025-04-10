#!/bin/bash -l        
#SBATCH --time=01:00:00
#SBATCH --ntasks=2
#SBATCH --mem=50g
#SBATCH --tmp=10g
#SBATCH --mail-type=ALL  
#SBATCH --mail-user=youremail




module load python
module load orthofinder

#Path to all proteome files .pep.all.fa or GFC*_*_protein.fa
cd path/to/your/MASTER_FISH_PROTS

python

for f in *fa ; do python path/to/primary_transcript.py $f ; done

#output makes a folder of Primary Transcripts "primary_transcripts"
#combine output from Funannotate for new genomes "Genome1.proteins.fa" 
