#!/bin/bash -l        
#SBATCH --time=96:00:00
#SBATCH --ntasks=120
#SBATCH --mem=500g
#SBATCH --tmp=300g
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=youremail




cd path/to/your/dir
 

module unload impi
module load  funannotate/testing



###########Run Funannotate Annotate to assign functional annotations to predicted genes using EggNOG-mapper and InterProScan outputs (funannotate/1.8.15)################
# - Requires the output directory from 'funannotate predict'
# - Integrates EggNOG-mapper results for orthology-based functional prediction
# - Adds domain-level annotations from InterProScan (XML format)
# - Specifies the BUSCO lineage used in previous steps for consistency
# - Uses 8 CPUs for parallel execution
# - The --force flag allows overwriting previous annotation outputs

funannotate annotate -i <funannotate_predict_output_directory> --force --busco_db actinopterygii --eggnog <eggnog_annotation_file> --iprscan <iprscan_output_file.xml> --cpus 8
