#!/bin/bash -l        
#SBATCH --time=12:00:00
#SBATCH --ntasks=4
#SBATCH --mem=50g
#SBATCH --tmp=50g
#SBATCH -p cavefish
#SBATCH --mail-type=ALL  
#SBATCH --mail-user=drabe004@umn.edu



module load trf/407b_64
module load recon/1.08
module load repeatmasker/4.0.5
module load repeatmodeler

cd /panfs/roc/groups/14/mcgaughs/drabe004/NewGenomes/MBRI

#Step 1: Build a database for the genome (in the example below the genome fasta file is PfluvDB GCA_010015445.1_GENO_Pfluv_1.0_genomic.fa and I chose the prefix PfluvDB for the database files)
#BuildDatabase -name MBRIDB MBRI_genome.fasta

#Step 2: Use the database to build a custon repeat library
#RepeatModeler -database MBRIDB -pa 100

#Step 3: Run RepeatMasker; I think you want to include the flag -xsmall to get a softmaksed genome as the output (check options with RepeatMasker -h after calling module load repeatmasker/4.0.5)
RepeatMasker -xsmall -pa 24 -lib ./RM_398182.FriJul91606562021/consensi.fa.classified -dir MBRI_masked_out MBRIDB MBRI_genome.fasta