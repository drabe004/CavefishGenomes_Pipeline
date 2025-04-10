# CavefishGenomes_Pipeline

A streamlined pipeline for processing 10x Genomics long-read genome assemblies in preparation for orthology analysis using OrthoFinder.

The pipeline includes a set of modular scripts to guide genome assemblies through masking, sorting, gene prediction, and annotation, resulting in high-quality, standardized outputs for comparative genomic analyses.

---

## Pipeline Overview

**Workflow:**  
Repeat masking → scaffold sorting → genome completeness check → gene prediction → functional annotation → transcript variant filtering → OrthoFinder input formatting

---

## 1) Repeat Masking — `1_RepeatMasker.sh`

**Purpose:**  
Identify and mask repetitive elements in the genome using a custom repeat library to reduce annotation artifacts.

**Input:**  
- Unmasked genome assembly in FASTA format.

**Output:**  
- Softmasked genome FASTA file with repetitive elements in lowercase.

**Description:**  
This script builds a species-specific repeat database using RepeatModeler, then applies RepeatMasker to generate a softmasked genome, preserving sequence length and structure while masking repetitive regions.

---

## 2) Scaffold Sorting — `2_Sort_genomes.sh`

**Purpose:**  
Reorder scaffolds by descending length and standardize FASTA headers to ensure compatibility with downstream tools.

**Input:**  
- Softmasked genome FASTA file from Step 1.

**Output:**  
- Sorted and renamed genome FASTA file.

**Description:**  
Scaffolds are sorted from longest to shortest, and each is renamed with a simplified identifier (e.g., GENOME1_1, GENOME1_2, etc.). This avoids parsing issues in tools that require clean or consistent headers.

---

## 3) Genome Completeness Assessment — `3_runBUSCO.sh`

**Purpose:**  
Assess the completeness of the genome assembly using Benchmarking Universal Single-Copy Orthologs (BUSCO).

**Input:**  
- Sorted and masked genome FASTA file from Step 2.

**Output:**  
- BUSCO summary report and lineage-specific completeness metrics.

**Description:**  
BUSCO is run against an appropriate lineage dataset (e.g., actinopterygii_odb10) to evaluate the presence, absence, and fragmentation of conserved orthologs, providing a quality check for annotation readiness.

---

## 4) Gene Prediction — `4_Funannotate_predict.sh`

**Purpose:**  
Generate gene models using evidence-based prediction with optimized parameters for non-model organisms.

**Input:**  
- Masked and sorted genome FASTA file.  
- BUSCO training results (optional but recommended).  

**Output:**  
- Predicted gene models in GFF3, FAA (proteins), and FNA (transcripts) formats.  
- Log files and summary statistics.

**Description:**  
Funannotate Predict uses ab initio prediction methods (including Augustus), trained with BUSCO data, to annotate gene structures across the genome. Parameters such as maximum intron length and BUSCO seed species can be adjusted for taxon-specific optimization.

---

## 5) Functional Annotation — `5_Funannotate_annotate.sh`

**Purpose:**  
Assign gene functions using InterProScan and EggNOG-mapper annotations.

**Input:**  
- Gene predictions from Step 4.  
- Protein sequences (FAA) and corresponding GFF3 annotations.

**Output:**  
- Functional annotation reports, domain predictions, GO terms, and orthology mappings.

**Description:**  
This step integrates multiple databases to assign biological function to predicted genes. InterProScan provides domain-based annotation, while EggNOG-mapper assigns orthology and pathway-level information for comparative genomics.

---

## 6) Remove transcript variants — `Run_Primary_Transcript` 'primary_transcript.py' from https://github.com/davidemms/OrthoFinder/blob/master/tools/primary_transcript.py

**Purpose:**  
Filter gene models to retain only the primary transcript per gene, reducing redundancy in downstream functional annotation and orthology analysis.

**Input:**  
- protein FASTA file annotated (FAA)

**Output:**  
- Functional annotation reports, domain predictions, GO terms, and orthology mappings.

**Description:**  
- FAA files containing only the longest (or first) transcript per gene 

---

## Output Summary

At the conclusion of the pipeline, the following key outputs will be available for each genome:

- Softmasked and scaffold-sorted genome FASTA  
- BUSCO completeness reports  
- Annotated gene models (GFF3, FAA, FNA)  
- Functional annotations (GO terms, domains, orthologs)  
- Cleaned gene sets ready for OrthoFinder input  

---

## Requirements

Ensure the following tools are installed and properly configured:

- RepeatModeler  
- RepeatMasker  
- Funannotate (v1.8.15)  
- BUSCO  
- InterProScan  
- EggNOG-mapper  

This pipeline is optimized for high-quality assemblies from non-model organisms and was developed using cavefish genomes as a test case.

---

## Author

Dr. Danielle H. Drabeck  
Researcher 5, University of Minnesota  
Website: https://www.danielledrabeck.com  

---

## Citations

If you use this pipeline or any of its components, please cite the following tools:

- Flynn, J. M., et al. (2020). RepeatModeler2 for automated genomic discovery of transposable element families. *PNAS*, 117(17), 9451–9457. https://doi.org/10.1073/pnas.1921046117  
- Smit, A.F.A., Hubley, R., & Green, P. RepeatMasker Open-4.0. http://www.repeatmasker.org  
- Palmer, J. M., & Stajich, J. E. (2020). Funannotate v1.8: Eukaryotic genome annotation. *Zenodo*. https://doi.org/10.5281/zenodo.2604804  
- Seppey, M., et al. (2019). BUSCO: Assessing genome assembly and annotation completeness. In *Gene Prediction*, Springer. https://doi.org/10.1007/978-1-4939-9173-0_14  
- Jones, P., et al. (2014). InterProScan 5: Genome-scale protein function classification. *Bioinformatics*, 30(9), 1236–1240. https://doi.org/10.1093/bioinformatics/btu031  
- Cantalapiedra, C. P., et al. (2021). eggNOG-mapper v2: Functional annotation, orthology assignments, and domain prediction at the metagenomic scale. *Mol. Biol. Evol.*, 38(12), 5825–5829. https://doi.org/10.1093/molbev/msab293

---

For support, questions, or contributions, please open an issue in the GitHub repository.
