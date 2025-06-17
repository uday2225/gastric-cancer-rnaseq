# ============================================================================
# R Script: Differential Gene Expression Analysis for Gastric vs Smooth Muscle
# ============================================================================

# ---------------------------
# Load Required Libraries
# ---------------------------
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
packages <- c("DESeq2", "edgeR", "genefilter", "pheatmap", "RColorBrewer", "statmod")
for (pkg in packages) if (!requireNamespace(pkg, quietly = TRUE)) BiocManager::install(pkg)
lapply(packages, library, character.only = TRUE)

# ---------------------------
# Define Sample Metadata
# ---------------------------
setwd("~/")  # Set working directory where count files exist

files <- c(
  "stomach_3a.s_trimmed.sorted.count.txt",
  "stomach_3b.s_trimmed.sorted.count.txt",
  "stomach_a.s_trimmed.sorted.count.txt",
  "smoothmuscle_8a.s_trimmed.sorted.count.txt",
  "smoothmuscle_8b.s_trimmed.sorted.count.txt",
  "smoothmuscle_8c.s_trimmed.sorted.count.txt"
)

samples <- c("stomach_3a", "stomach_3b", "stomach_a", "smoothmuscle_8a", "smoothmuscle_8b", "smoothmuscle_8c")
conditions <- c("stomach", "stomach", "stomach", "smoothmuscle", "smoothmuscle", "smoothmuscle")

sampleTable <- data.frame(sampleName = samples, fileName = files, condition = conditions)

# ---------------------------
# Step 1: DESeq2 Workflow
# ---------------------------
project_data1 <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, design = ~ condition)
project_data1 <- project_data1[ rowSums(counts(project_data1)) > 1, ]

rld <- rlog(project_data1, blind = FALSE)

# Distance Heatmap
sampleDists <- dist(t(assay(rld)))
sampleDistMatrix <- as.matrix(sampleDists)
df <- as.data.frame(colData(rld)[, "condition", drop = FALSE])
colors <- colorRampPalette(rev(brewer.pal(9, "Blues")))(255)

pheatmap(sampleDistMatrix, clustering_distance_rows = sampleDists,
         clustering_distance_cols = sampleDists, col = colors)

# PCA Plot
plotPCA(rld, intgroup = "condition")

# Gene Heatmap: Top 50 Variable Genes
geneVars <- rowVars(assay(rld))
topVarGenes <- order(geneVars, decreasing = TRUE)[1:50]
mat <- assay(rld)[topVarGenes, ]
mat <- mat - rowMeans(mat)

clear_col_names <- paste(sampleTable$sampleName)
pheatmap(mat, annotation_col = df, labels_col = clear_col_names)

# ---------------------------
# Step 2: edgeR Workflow
# ---------------------------
dge <- readDGE(files, group = conditions, labels = samples)
y <- DGEList(counts = dge$counts, genes = rownames(dge$counts))
y <- calcNormFactors(y)
y$samples$group <- conditions

# MDS Plot
plotMDS(y)

# Dispersion Estimation and BCV Plot
y <- estimateDisp(y)
plotBCV(y)

# Exact Test (smoothmuscle vs stomach)
et <- exactTest(y, pair = c("stomach", "smoothmuscle"))
summary(de <- decideTestsDGE(et))

# Smear Plot
detags <- rownames(y)[as.logical(de)]
plotSmear(et, de.tags = detags)
abline(h = c(-1, 1), col = "blue")

# Export DEGs
diffExpGenes <- topTags(et, n = 1000, p.value = 0.05)
write.table(diffExpGenes$table, file = "DGE_results_smoothmuscle_vs_stomach.txt",
            sep = "\t", quote = FALSE, col.names = NA)

# ---------------------------
# End of Script
# ---------------------------
