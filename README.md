Code for panagi et.al. 2025

This repository contains the code and resources associated with the scientific paper by panagi et al. The specific usage instructions and expected outputs can be found within the comments of each script.

The analysis can be summarized in the following 2 steps:

Alignment
Differential expression analysis

Raw reads were aligned to the Drosophila genomic build dm6 through in two steps. Firstly, reads were mapped with hisat2 using the default parameters and then, the unmapped reads were mapped with bowtie2 using the local and very sensitive parameters. 
Prior to the statistical testing procedure, the gene read counts were filtered for possible artifacts that could affect the subsequent statistical testing procedures. Genes presenting any of the following were excluded from further analysis: i) genes with zero reads (6531), ii) genes with length less than 500 (817 genes), iii) genes whose average reads per 100 bp was less than the 25th quantile of the total normalized distribution of average reads per 100bp (824 genes with cutoff value 0.26135 average reads per 100 bp), iv) genes with read counts below the median read counts of the total normalized count distribution (3931 genes with cutoff value) normalized read counts. The total (unified) number of genes excluded due to the application of all filters was 12055. The resulting gene counts were subjected to differential expression analysis for the contrasts Byn versus Byn_Ras V12 using the Bioconductor package metaseqR2 with the DESeq algorithm and the utr parameter. Differentially expressed genes were identified based on an absolute log2 fold change (|log2(FC)|) >= 1 and a p-value < 0.05.
