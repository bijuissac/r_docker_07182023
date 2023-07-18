required.packages <- c(
  "Matrix.utils",
  "png",
  "dplyr",
  "ggplot2",
  "devtools",
  "remotes",
  "Seurat",
  "igraph",
  "R.utils",
  "UpSetR",
  "pheatmap",
  "msigdbr",
  "markdown",
  "rmarkdown",
  "DT",
  "grr"
)

bioconductor_packages <- c(
  "BiocGenerics", 
  "DelayedArray", 
  "DelayedMatrixStats",
  "limma", 
  "lme4", 
  "S4Vectors", 
  "SingleCellExperiment",
  "SummarizedExperiment", 
  "batchelor", 
  "Matrix.utils", 
  "fgsea",
  "HDF5Array", 
  "terra", 
  "ggrastr", 
  "slingshot", 
  "tradeSeq", 
  "BiocFileCache", 
  "clusterProfiler",
  "org.Hs.eg.db", 
  "Biobase", 
  "Matrix.utils"
)

new.packages <- required.packages[!(required.packages %in% installed.packages()[, "Package"])]

if (length(new.packages) > 0) {
  install.packages(new.packages)
}

bioconductor_packages <- bioconductor_packages[!(bioconductor_packages %in% installed.packages()[, "Package"])]

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager", version = "3.14")
}
BiocManager::install()

for (biopack in bioconductor_packages) {
  BiocManager::install(biopack)
}
install.packages("https://cran.r-project.org/src/contrib/Archive/Matrix.utils/Matrix.utils_0.9.7.tar.gz", repos = NULL, type = "source")

devtools::install_github("cole-trapnell-lab/monocle3")
remotes::install_github("satijalab/seurat-wrappers")
remotes::install_github("kstreet13/bioc2020trajectories")
devtools::install_github("jokergoo/ComplexHeatmap")

install.packages("BiocManager",version="1.30.18")
install.packages("ggplot2",version="3.3.6")
install.packages("ggrepel",version="0.9.1")
install.packages("remotes",version="2.4.2")
install.packages("tidyr",version="1.2.1")

metanr_packages <- function(){

  metr_pkgs <- c("impute", "pcaMethods", "globaltest", "GlobalAncova", "Rgraphviz", "preprocessCore", "genefilter", "sva", "limma", "KEGGgraph", "siggenes","BiocParallel", "M
Snbase", "multtest","RBGL","edgeR","fgsea","devtools","crmn","httr","qs")
  
  list_installed <- installed.packages()
  
  new_pkgs <- subset(metr_pkgs, !(metr_pkgs %in% list_installed[, "Package"]))
  
  if(length(new_pkgs)!=0){
    
    if (!requireNamespace("BiocManager", quietly = TRUE))
        install.packages("BiocManager")
    BiocManager::install(new_pkgs)
    print(c(new_pkgs, " packages added..."))
  }
  
  if((length(new_pkgs)<1)){
    print("No new packages added...")
  }
}
metanr_packages()
install.packages("pacman")

library(pacman)

pacman::p_load(c("impute", "pcaMethods", "globaltest", "GlobalAncova", "Rgraphviz", "preprocessCore", "genefilter", "sva", "limma", "KEGGgraph", "siggenes","BiocParallel", "M
Snbase", "multtest","RBGL","edgeR","fgsea","httr","qs"))

devtools::install_github("jokergoo/ComplexHeatmap")
devtools::install_github("xia-lab/MetaboAnalystR", build = TRUE, build_vignettes = FALSE)
