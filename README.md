
# 🧬 Gastric Cancer Transcriptomic Analysis

This project presents a comprehensive transcriptomic analysis comparing gene expression between **gastric (stomach)** and **smooth muscle** tissues using **RNA-Seq data**. The goal was to uncover potential biomarkers and gene signatures relevant to **gastric cancer progression** by performing differential gene expression analysis, data visualization, and functional enrichment.

---

## 📁 Project Structure

```bash
├── differential_expression_analysis_clean.R   # Main analysis pipeline (DESeq2, edgeR, PCA, heatmaps)
├── DGE_results_smoothmuscle_vs_stomach.txt    # Output of top differentially expressed genes
├── Gastric_Cancer_Transcriptomics.pdf         # Final report with figures and interpretations
└── README.md
```

---

## 🧪 Key Techniques & Tools

| Task                        | Tools / Libraries Used                               |
|-----------------------------|------------------------------------------------------|
| Quality Control             | `FastQC`                                             |
| Trimming                    | `Trim Galore` (Cutadapt backend)                    |
| Alignment                   | `HISAT2`                                             |
| Counting                    | `HTSeq-count`                                        |
| Statistical Analysis        | `DESeq2`, `edgeR`, `statmod`                        |
| Visualization               | `PCA`, `heatmaps`, `MDS`, `BCV`, `Smear`, `STRING`  |
| Enrichment Analysis         | `DAVID`, `STRING`                                    |
| Scripting Language          | `R`, `Bioconductor packages`                         |

---

## 🔍 Objective

To identify significantly differentially expressed genes in gastric tissues compared to smooth muscle, understand their potential roles in **cancer development**, and visualize the molecular patterns using **PCA**, **heatmaps**, and **network analysis**.

---

## 📊 Key Findings

- **Upregulated in Smooth Muscle**: `MYLK`, `ACTA2`, `CNN1`, `TAGLN`
- **Upregulated in Stomach / Down in Smooth Muscle**: `GKN1`, `TFF2`, `GHRL`, `PGC`
- **Significant Clustering** of tissues using PCA (PC1 = 79% variance explained)
- Enrichment analysis pointed to:
  - **Cytoskeleton organization**
  - **Gastric mucosal defense**
  - **Oncogenic signaling pathways**

---

## 📈 Visualizations

| Figure | Description                         |
|--------|-------------------------------------|
| PCA    | Clear separation of tissue types    |
| Heatmap| Top 50 most variable genes clustered|
| BCV    | Dispersion patterns for DE analysis |
| Smear  | Distribution of DE genes            |
| STRING | Network of functional relationships |

---

## 👨‍💻 Author

**Uday Kiran**  

[LinkedIn](https://www.linkedin.com/in/udaykiran01/)

---

## 🧾 License

This project is licensed under the **MIT License**.
