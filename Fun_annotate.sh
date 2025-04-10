#!/bin/bash -l        
#SBATCH --time=96:00:00
#SBATCH --ntasks=120
#SBATCH --mem=500g
#SBATCH --tmp=300g
#SBATCH -p astyanax
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=drabe004@umn.edu
#SBATCH --job-name=AN_MBRI



cd /panfs/roc/groups/14/mcgaughs/drabe004/Funnannote_Full/MBRI_FINAL
 

module unload impi

module load  funannotate/testing

funannotate annotate -i /panfs/roc/groups/14/mcgaughs/drabe004/Funnannote_Full/MBRI_FINAL --force --busco_db actinopterygii --eggnog /panfs/roc/groups/14/mcgaughs/drabe004/Eggnog/eggnog-mapper-2.1.6/eggnog_MBRI.emapper.annotations --iprscan /panfs/roc/groups/14/mcgaughs/drabe004/Interprotscan/outfiles/MBRIoutput.xml --cpus 8 