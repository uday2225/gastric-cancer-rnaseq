# Integrative Transcriptomic Analysis of Gastric Cancer

This project investigates gene expression differences between stomach and smooth muscle tissues using RNA-Seq analysis. It applies trimming, alignment, read counting, PCA, heatmaps, and differential gene expression analysis using DESeq2 and edgeR.

## Abstract
This study investigates gene expression differences between stomach and smooth muscle tissues to uncover biomarkers and therapeutic targets relevant to gastric cancer. Using RNA-Seq data, preprocessing steps included quality control, trimming, alignment, and read counting. Differential expression analysis identified key upregulated genes in smooth muscle (MYLK, CNN2) and downregulated genes in gastric cancer (GKN1, GHRL). PCA and heatmaps revealed clear tissue-specific clustering. Enrichment analysis (DAVID) and network visualizations (STRING) were employed to interpret functional relevance.

## Methods
- **Sample Source**: Human tissue samples from Uppsala Biobank, Sweden
- **QC**: FastQC v0.11.9
- **Trimming**: Trim Galore v0.6.6
- **Alignment**: Hisat2 v2.2.2
- **Counting**: HTSeq
- **Analysis**: DESeq2, edgeR, DAVID, STRING

## Workflow
1. QC and trimming
2. Mapping to reference genome
3. Read counting and normalization
4. rlog transformation, PCA, heatmap generation
5. Differential expression analysis (edgeR)
6. Enrichment (DAVID) and network analysis (STRING)

## Key Results
- Upregulated in smooth muscle: **MYLK**, **ACTA2**, **CNN1**
- Downregulated in smooth muscle (i.e., upregulated in stomach): **GKN1**, **TFF2**, **GHRL**
- PCA showed 86% variance explained (PC1 + PC2)
- edgeR analysis revealed 1,587 upregulated, 2,243 downregulated genes (FDR < 0.05)

## Heatmap (Top 50 Variable Genes)
![Heatmap](figures/heatmap_top50.png)

## References
- Hu, J. et al. (2017). Tumour Biology. DOI:10.1177/1010428317706455
- Luo, J. & Xiang, H. (2021). Bioengineered. DOI:10.1080/21655979.2021.1944019
- di Stadio, C.S. et al. (2019). Biochimie. DOI:10.1016/j.biochi.2019.09.005
- Wang, J. et al. (2023). Frontiers in Oncology. DOI:10.3389/fonc.2023.1142017
