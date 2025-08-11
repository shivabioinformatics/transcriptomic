#!/bin/bash

# Set directory paths
DATADIR=/Users/labuser3/transcriptomic_project/rna_seq_Arabidopsis_thaliana/data
WORKDIR=/Users/labuser3/transcriptomic_project/rna_seq_Arabidopsis_thaliana/tophat
ANNOT=${DATADIR}/athal_genes.gtf
BWT2IDX=${DATADIR}/athal

# Create output directories
mkdir -p ${WORKDIR}/Day8
mkdir -p ${WORKDIR}/Day16

# Run TopHat2 for Day8 sample
echo "Processing Day8 sample..."
tophat2 -o ${WORKDIR}/Day8 \
        -p 8 \
        --max-multihits=10 \
        -G ${ANNOT} \
        ${BWT2IDX} \
        ${DATADIR}/Day8.fastq

# Run TopHat2 for Day16 sample  
echo "Processing Day16 sample..."
tophat2 -o ${WORKDIR}/Day16 \
        -p 8 \
        --max-multihits=10 \
        -G ${ANNOT} \
        ${BWT2IDX} \
        ${DATADIR}/Day16.fastq

echo "TopHat2 alignment completed!"