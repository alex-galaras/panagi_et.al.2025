#This script performs differential expression analysis between the 2 groups BynRas vs Byn.

# Define directory paths
the.path <- "/media/samba/hatzis_lab/apidianakis/BynRas/analysis"  # Base directory for the analysis
save <- "/media/samba/hatzis_lab/apidianakis/BynRas/analysis"      # Directory where results will be saved
out_name <- "metaseqR2_Ras_Byn"                                   # Output name for the analysis results

# Define the contrast for the analysis
the.contrasts <- "Ras_vs_Byn"  # Comparison group: Ras versus Byn

# Load the metaseqR2 library for RNA-seq data analysis
library(metaseqR2)

# Run the metaseqR2 analysis with the specified parameters
metaseqr2(
  sampleList = file.path(the.path, "targets.txt"),  # Path to the sample list file containing experimental groups
  contrast = the.contrasts,                        # Contrast to analyze
  org = "dm6",                                     # Genome build (Drosophila melanogaster, version dm6)
  countType = "utr",                               # Type of count data (UTR counts)
  # annotation = "embedded",                       # Annotation source (commented out here)
  normalization = "deseq",                         # Normalization method (DESeq)
  statistics = "deseq",                            # Statistical method for differential expression (DESeq)
  figFormat = c("png", "pdf"),                     # Output formats for visualizations
  exportWhere = file.path(save, out_name),         # Directory and name for exported results
  restrictCores = 0.25,                            # Percentage of cores used for parallel processing
  exportStats = "cv",                              # Export coefficient of variation as a statistical measure
  qcPlots = c("mds", "biodetection", "countsbio", "readnoise",   # Quality control plots to generate
              "filtered", "correl", "boxplot", "gcbias", 
              "lengthbias", "meandiff", "deheatmap", "volcano", 
              "biodist", "mastat"), 
  exonFilters = NULL,                              # No exon-level filtering applied
  pcut = 0.05,                                     # p-value cutoff for significant results
  exportWhat = c("annotation", "p_value", "meta_p_value",        # Data elements to export
                 "adj_p_value", "fold_change", "stats", 
                 "counts", "flags"),
  exportScale = c("natural", "log2", "rpgm"),      # Scales for exported data
  exportValues = "normalized",                     # Export normalized counts
  exportCountsTable = TRUE,                        # Export a table of counts
  saveGeneMode = TRUE,                             # Save data for gene mode
  reportTop = 0.1,                                 # Include the top 10% of results in the report
  reportDb = "dexie",                              # Database format for the report
  createTracks = TRUE,                             # Create genome browser tracks for visualization
  overwrite = TRUE,                                # Overwrite existing tracks if present
  trackInfo = list(                                # Details for creating genome browser tracks
    stranded = TRUE,                               # Indicate if data is stranded
    normTo = 1e+08,                                # Normalization factor for tracks
    urlBase = "http://epigenomics.fleming.gr/~alexandros/apidianakis_Ras_vs_Byn",  # Base URL for tracks
    hubInfo = list(                                # Metadata for track hubs
      name = "Ras vs Byn",                         # Name of the hub
      shortLabel = "Ras vs Byn",                   # Short label for the hub
      longLabel = "Ras vs Byn"                     # Detailed label for the hub
      email = "galaras@fleming.gr"                 # Contact email for the hub
    )
  )
)

