# CavefishGenomes_Pipeline
A set of scripts for processing of 10x Genomics long-read genome assemblies for Orthofinder 


 mask –> sort  –> predict –> annotate –> rename –> remove transcript varients –> Orthofinder

1) 1_RepeatMasker.sh:
Mask Assemblies with RepeatMasker, use Repeatmodeler to make a custom database:
#Step 1: Build a database for the genome (in the example below the genome fasta file is CAVEgenome.fa and I chose the prefix CAVEDB for the database files)
BuildDatabase -name CAVEDB CAVEgenome.fa

#Step 2: Use the database to build a custon repeat library
RepeatModeler -database CAVEDB -pa 100

#Step 3: Run RepeatMasker; Include the flag -xsmall to get a softmaksed genome as the output (repeatmasker/4.0.5)
RepeatMasker -xsmall -pa 24 -lib ./CAVEDB/consensi.fa.classified -dir CAVEDB_masked_out CAVEDB CAVEgenome.fa

2) 2_Funannotate_predict.sh
Use Funannotate to predict genes:  Annotate the softmasked genome using Funannotate Predict with optimized Augustus models, repeat evidence, and BUSCO training (funannotate/1.8.15)
Run `2_Funannotate_predict.sh` on the repeat-masked *CAVEgenome* genome using 20 CPUs, setting the maximum intron length to 50,000 bp, specifying zebrafish as the seed species for BUSCO training, and optimizing Augustus gene predictions; outputs written to `output_fun_CAVEgenome`.

3) 3_Funannotate_annotate.sh
Run Funannotate Annotate to add functional annotation using InterProScan and EggNOG-mapper outputs (funannotate/1.8.15)
