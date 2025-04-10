#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=2gb
#SBATCH --tmp=100gb
#SBATCH -t 96:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=youremail


cd dir/to/your/genomes

module load  funannotate/1.6.0

# Sorts scaffolds in the input genome by length and renames them with simplified headers (e.g., GENOME1_1, GENOME1_2...) to ensure compatibility with downstream tools
funannotate sort  -i masked_genome.fa -o masked_genome_sorted.fasta -b GENOME1


