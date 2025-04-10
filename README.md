# 🐟 CavefishGenomes_Pipeline

**A streamlined pipeline for processing 10x Genomics long-read genome assemblies for OrthoFinder input.**  
Developed for genome annotation and comparative analysis in non-model species, particularly cavefish.

This pipeline takes assembled genomes through a series of preprocessing, annotation, and formatting steps to produce high-quality gene models compatible with orthology inference using OrthoFinder.

**Workflow:**  
*Repeat masking → scaffold sorting → genome completeness check → gene prediction → functional annotation → transcript variant cleanup → OrthoFinder-ready output*

---

## 📁 Pipeline Steps

### 1) Repeat Masking — `1_RepeatMasker.sh`
**Goal:** Mask repetitive elements using a custom repeat library.  
**Tools:** RepeatModeler, RepeatMasker (v4.0.5)
Step 1: Build a RepeatModeler database from your genome
Step 2: Generate a custom repeat library
Step 3: Mask repeats in the genome (softmasked output)

2) Scaffold Sorting — 2_Sort_genomes.sh
Goal: Sort scaffolds by length and assign simplified FASTA headers to avoid downstream parsing issues.
Tool: funannotate sort

bash
Copy
Edit
funannotate sort -i masked_genome.fa -o masked_genome_sorted.fasta -b GENOME1
3) Genome Completeness — 3_runBUSCO.sh
Goal: Assess genome completeness and summarize gene content using BUSCO.
Tool: BUSCO

Evaluates the completeness of gene content using single-copy orthologs from a specified lineage dataset (e.g., actinopterygii_odb10).

4) Gene Prediction — 4_Funannotate_predict.sh
Goal: Predict gene models using evidence-guided annotation.
Tool: Funannotate Predict (v1.8.15)

Run on the softmasked genome with:

20 CPUs

Max intron length: 50,000 bp

BUSCO-trained Augustus models (e.g., using zebrafish as the seed species)

bash
Copy
Edit
funannotate predict -i masked_genome_sorted.fasta -o output_fun_CAVEgenome \
  --species "Species name" --strain CAVE \
  --cpus 20 --max_intronlen 50000 \
  --busco_seed_species zebrafish
5) Functional Annotation — 5_Funannotate_annotate.sh
Goal: Add functional annotation to predicted gene models.
Tool: Funannotate Annotate (v1.8.15)

Integrates annotations from:

InterProScan for domain and GO term annotation

EggNOG-mapper for orthology and functional prediction

bash
Copy
Edit
funannotate annotate -i output_fun_CAVEgenome --cpus 20
🧬 Output Summary
By the end of the pipeline, you will have:

A softmasked genome FASTA file

A BUSCO summary report (completeness metrics)

Predicted gene models in GFF3, FAA, and FNA formats

Functional annotation files

A cleaned gene set prepared for input into OrthoFinder

🔧 Requirements
Ensure the following tools are installed and configured in your environment:

RepeatModeler

RepeatMasker

Funannotate (v1.8.15)

BUSCO

InterProScan

EggNOG-mapper

📌 Notes
Scripts are modular and can be run independently or integrated into a larger pipeline framework.

Adjust CPU settings (-pa, --cpus) to suit your computational environment.

Originally developed for use with cavefish genomes but is adaptable to other non-model vertebrates.

👩‍🔬 Author
Dr. Danielle H. Drabeck
Researcher 5, University of Minnesota
https://www.danielledrabeck.com
Twitter: @DanielleDrabeck

📚 Citations
If you use this pipeline or any of its components in your research, please cite the relevant tools:

Flynn, J. M., Hubley, R., Goubert, C., Rosen, J., Clark, A. G., Feschotte, C., & Smit, A. F. (2020). RepeatModeler2 for automated genomic discovery of transposable element families. PNAS, 117(17), 9451–9457. https://doi.org/10.1073/pnas.1921046117

Smit, A.F.A., Hubley, R. & Green, P. RepeatMasker Open-4.0. 2013–2015. http://www.repeatmasker.org

Palmer, J. M., & Stajich, J. E. (2020). Funannotate v1.8: Eukaryotic genome annotation. Zenodo. https://doi.org/10.5281/zenodo.2604804

Seppey, M., Manni, M., & Zdobnov, E. M. (2019). BUSCO: Assessing genome assembly and annotation completeness. In Gene Prediction (pp. 227–245). Springer. https://doi.org/10.1007/978-1-4939-9173-0_14

Jones, P., et al. (2014). InterProScan 5: Genome-scale protein function classification. Bioinformatics, 30(9), 1236–1240. https://doi.org/10.1093/bioinformatics/btu031

Cantalapiedra, C. P., et al. (2021). eggNOG-mapper v2: Functional annotation, orthology assignments, and domain prediction at the metagenomic scale. Molecular Biology and Evolution, 38(12), 5825–5829. https://doi.org/10.1093/molbev/msab293

For questions, contributions, or issues, please open an issue in the GitHub repository or contact the author directly.
