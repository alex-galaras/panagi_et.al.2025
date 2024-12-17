#buildAnnotationDatabase(c("mm10","hg38","hg19")) or download from the moulos github, from the google drive link
#utrs <- loadAnnotation(genome="mm10",refdb="ensembl",level="gene",type="utr")

the.path <- "/media/samba/hatzis_lab/apidianakis/BynRas/analysis"
save <- "/media/samba/hatzis_lab/apidianakis/BynRas/analysis"
out_name="metaseqR2_Ras_Byn"

the.contrasts <- "Ras_vs_Byn"
library(metaseqR2)

metaseqr2(sampleList = file.path(the.path, "targets.txt"), 
          contrast = the.contrasts, 
          org = "dm6",
          countType = "utr", 
          #annotation="embedded",
          normalization = "deseq", 
          statistics = "deseq", 
          figFormat = c("png", "pdf"), 
          exportWhere = file.path(save, out_name), 
          restrictCores = 0.25,
          exportStats = "cv",
          qcPlots = c("mds", "biodetection", "countsbio", "readnoise", 
                      "filtered", "correl", "boxplot", "gcbias", "lengthbias", 
                      "meandiff", "deheatmap", "volcano", "biodist", "mastat"), 
          exonFilters = NULL, 
          pcut = 0.05, 
          exportWhat=c("annotation", "p_value", "meta_p_value", "adj_p_value", "fold_change", "stats", "counts", "flags"),
          exportScale = c("natural","log2", "rpgm"), 
          exportValues = "normalized", 
          exportCountsTable = TRUE,
          saveGeneMode = TRUE,
          reportTop = 0.1,
          reportDb= "dexie",
          createTracks = TRUE, 
          overwrite = TRUE, 
          trackInfo = list(stranded = TRUE, 
                           normTo = 1e+08, 
                           urlBase = "http://epigenomics.fleming.gr/~alexandros/apidianakis_Ras_vs_Byn", 
                           hubInfo = list(name = "SKNSH KO", 
                                          shortLabel = "SKNSH KO", 
                                          longLabel = "SKNSH KO", 
                                          email = "galaras@fleming.gr")))

