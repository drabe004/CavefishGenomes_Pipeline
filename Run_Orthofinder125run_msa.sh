#!/bin/bash -l        
#SBATCH --time=96:00:00
#SBATCH --ntasks=128
#SBATCH --mem=1995g
#SBATCH --tmp=850g
#SBATCH --mail-type=ALL
#SBATCH -p ag2tb 
#SBATCH --mail-user=drabe004@umn.edu
 
cd /panfs/jay/groups/26/mcgaughs/drabe004/OrthoFinderScripts
module purge
module load orthofinder/2.5.4
module load fasttree


orthofinder -M msa -T fasttree -f /panfs/jay/groups/26/mcgaughs/drabe004/Orthofinder_Datasets/125_Species -s /panfs/jay/groups/26/mcgaughs/drabe004/Orthofinder_Datasets/SpeciesTree_rooted_drop.tre
