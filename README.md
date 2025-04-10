# CavefishGenomes_Pipeline
A set of scripts for processing of 10x Genomics long-read genome assemblies for Orthofinder 


 mask –> sort  –> predict –> annotate –> rename –> remove transcript varients –> Orthofinder

1) Mask Assemblies with RepeatMasker:

#Step 1: Build a database for the genome (in the example below the genome fasta file is CAVEgenome.fa and I chose the prefix CAVEDB for the database files)
BuildDatabase -name CAVEDB CAVEgenome.fa

#Step 2: Use the database to build a custon repeat library
RepeatModeler -database CAVEDB -pa 100

#Step 3: Run RepeatMasker; Include the flag -xsmall to get a softmaksed genome as the output (repeatmasker/4.0.5)
RepeatMasker -xsmall -pa 24 -lib ./CAVEDB/consensi.fa.classified -dir CAVEDB_masked_out CAVEDB CAVEgenome.fa
