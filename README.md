# Transcriptomic Analysis Pipeline

This project contains a comprehensive RNA-seq analysis pipeline using TopHat for read alignment and Cufflinks for transcript assembly. The analysis compares gene expression between two developmental time points (Day 8 and Day 16) in *Arabidopsis thaliana* chromosome 4.

## Dataset Overview

The pipeline processes paired RNA-seq datasets:
- **Day8.fastq**: Early developmental stage (63,573 reads)
- **Day16.fastq**: Later developmental stage (57,985 reads)

## Analysis Pipeline

### 1. Read Alignment (TopHat)

TopHat performs splice-aware alignment of RNA-seq reads to the reference genome, with options for both guided (with GTF) and unguided alignment.

**Key Results:**
- Day 8: 99.8-99.9% mapping efficiency (63,476-63,489 mapped reads)
- Day 16: 99.9% mapping efficiency (57,943-57,951 mapped reads)
- Spliced alignments: 217-220 (Day 8), 314-319 (Day 16)

### 2. Transcript Assembly (Cufflinks)

Cufflinks reconstructs transcript models from aligned reads and estimates expression levels (FPKM values).

**Discovery Summary:**
| Sample | Genes | Transcripts | Single-exon | Multi-exon | Single-transcript genes |
|--------|-------|-------------|-------------|------------|------------------------|
| Day 8  | 186   | 193         | 114         | 64         | 166                    |
| Day 16 | 81    | 93          | 21          | 72         | 63                     |

## Directory Structure

```
Transcriptomic/
├── data/                          # Reference genome and raw data
│   ├── athal_chr.fa              # Chromosome 4 reference sequence
│   ├── athal_genes.gtf           # Gene annotations
│   ├── Day8.fastq & Day16.fastq  # RNA-seq reads
│   └── atha_chr.*.bt2            # Bowtie2 index files
├── commands/                      # Analysis scripts
│   ├── com.tophat                # TopHat alignment commands
│   └── com.cufflinks             # Cufflinks assembly commands
└── result/
    ├── tophat/                   # Alignment results
    │   ├── with_gtf/             # GTF-guided alignments
    │   └── without_gtf/          # De novo alignments
    └── cufflinks/                # Transcript assemblies
        ├── Day8/                 # Day 8 expression data
        └── Day16/                # Day 16 expression data
```

## Key Findings

The analysis reveals significant differences between developmental stages:

1. **Gene Discovery**: Day 8 shows higher transcriptional activity with 186 genes vs 81 in Day 16
2. **Splice Complexity**: Day 16 exhibits more complex splicing patterns (77% multi-exon vs 36% in Day 8)
3. **Mapping Quality**: Both samples achieve excellent alignment rates (>99.8%)

## Usage

The pipeline consists of two main stages:

1. **Alignment**: Run TopHat to map reads to the reference genome
2. **Assembly**: Use Cufflinks to reconstruct transcripts and estimate expression

All commands are documented in the `commands/` directory for reproducible analysis.

## Output Files

- **align_summary.txt**: Mapping statistics and quality metrics
- **accepted_hits.bam**: Successfully aligned reads
- **junctions.bed**: Identified splice junctions
- **genes.fpkm_tracking**: Gene-level expression estimates
- **isoforms.fpkm_tracking**: Transcript-level expression data
- **transcripts.gtf**: Reconstructed transcript models

This pipeline provides a robust framework for comparative transcriptome analysis and differential gene expression studies.

## Original Analysis Notes

Here, I perform RNA_Seq analysis to determine genes that are differentioally expressed at different stages in the development of Arabidopsis thaliana shoot apical meristem. The samples are collected at day 8, 16. Data files are including ("Day8.fastq" and "Day16.fastq") the samples are collected, extracted and being sequenced the cellular mRNA, and now set to perform the bioinformatics analysis. 

The refernce genome is under athal_chr.fa and the reference gene annotation are in "athal_genes.gtf". 




