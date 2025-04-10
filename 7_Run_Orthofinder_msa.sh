#!/bin/bash -l        
#SBATCH --time=96:00:00
#SBATCH --ntasks=128
#SBATCH --mem=1995g
#SBATCH --tmp=850g
#SBATCH --mail-type=ALL
#SBATCH --mail-user=youremail
 
cd path/to/orthofinder/scripts

module purge
module load orthofinder/2.5.4
module load fasttree


# Step 7: Run OrthoFinder to assign orthogroups and infer gene/species trees using MSA and FastTree
# - Uses protein sequences (FAA) filtered to primary transcripts from 125 species
# - Performs multiple sequence alignment (-M msa) for accurate gene tree inference
# - Uses FastTree (-T fasttree) for fast and scalable tree construction
# - Includes a user-supplied rooted species tree for improved orthology inference
# -This takes a LOT of resources run on MSA mode walltime estimate is ~800 hours


orthofinder -M msa -T fasttree -f /path/to/primary/transcripts/125_Species -s path/to/species/tree/SpeciesTree_rooted.tre
