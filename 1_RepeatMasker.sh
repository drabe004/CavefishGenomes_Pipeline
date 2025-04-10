#!/bin/bash -l        
#SBATCH --time=12:00:00
#SBATCH --ntasks=4
#SBATCH --mem=50g
#SBATCH --tmp=50g
#SBATCH --mail-type=ALL  
#SBATCH --mail-user=youremail



module load trf/407b_64
module load recon/1.08
module load repeatmasker/4.0.5
module load repeatmodeler

cd /path/to/your/genomes

#Step 1: Build a database for the genome (in the example below the genome fasta file is CAVEgenome.fa and I chose the prefix CAVEDB for the database files) 
BuildDatabase -name CAVEDB CAVEgenome.fa

#Step 2: Use the database to build a custon repeat library 
RepeatModeler -database CAVEDB -pa 100

#Step 3: Run RepeatMasker; Include the flag -xsmall to get a softmaksed genome as the output (repeatmasker/4.0.5) 
RepeatMasker -xsmall -pa 24 -lib ./CAVEDB/consensi.fa.classified -dir CAVEDB_masked_out CAVEDB CAVEgenome.fa
