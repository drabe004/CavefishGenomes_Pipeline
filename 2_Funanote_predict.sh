#!/bin/bash -l        
#SBATCH --time=96:00:00
#SBATCH --ntasks=120
#SBATCH --mem=500g
#SBATCH --tmp=300g
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=youremail


cd path/to/your/dir

module unload impi

module load  funannotate/incomplete.1.8.5

export PATH=$PATH:/panfs/roc/groups/14/mcgaughs/drabe004/Actinopteriigii_BUSCO_DB/


funannotate predict --cpus 20 \
 -i <softmasked_genome.fa> \
 --species "<Genus species>" \
 --max_intronlen 50000 \
 --repeats2evm \
 --busco_seed_species <seed_species> \
 --organism other \
 --busco_db actinopterygii \
 --optimize_augustus \
 --force \
 -o <output_directory>
