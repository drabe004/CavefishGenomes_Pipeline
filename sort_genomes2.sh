#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=2gb
#SBATCH --tmp=100gb
#SBATCH -t 96:00:00
#SBATCH -p astyanax
#SBATCH --mail-type=ALL
#SBATCH --mail-user=drabe004@umn.edu
#SBATCH --job-name=SORTSCAFF

cd /panfs/roc/groups/14/mcgaughs/drabe004/NewGenomes/TYPE10x/TYPE_masked_out

module load  funannotate/1.6.0


funannotate sort  -i Typhlias_pearsei_1.fasta -o Typhlias_pearsei_sorted.fasta -b TYPE


