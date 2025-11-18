#!/usr/bin/env bash
    cd /home/rstudio
    chown -R 1000 /home/rstudio
    mkdir rnaseq
    mkdir 16s
    mkdir ABRCMS
    chown -R 1000 /home/rstudio/16s
    chown -R 1000 /home/rstudio/rnaseq
    chown -R 1000 /home/rstudio/ABRCMS

    R -e "install.packages('learnr')"
    R -e "BiocManager::install('clusterProfiler')"
    R -e "BiocManager::install('org.Dm.eg.db')"
    R -e "BiocManager::install('org.Mm.eg.db')"
    R -e "BiocManager::install('phyloseq')"
    R -e "BiocManager::install('DOSE')" 
    R -e "remotes::install_github('C-MOOR/testdriveRData')"
    R -e "remotes::install_github('C-MOOR/MarianesMidgutData')"
    R -e "remotes::install_github('C-MOOR/GuthrieMisoData')"
    R -e "remotes::install_github('C-MOOR/SharonBrainData')"
    R -e "remotes::install_github('C-MOOR/HumanGutMicrobiomeData')"
    
    git clone https://github.com/c-moor/cure-rnaseq/ /home/rstudio/cure-rnaseq
    chown -R 1000 /home/rstudio/cure-rnaseq
    mv cure-rnaseq cmoor-files

    cd /home/rstudio/rnaseq

    ln -s /home/rstudio/cmoor-files/tutorials/Model_Organisms_Intro /home/rstudio/rnaseq/1-intro-model-org
    ln -s /home/rstudio/cmoor-files/tutorials/Model_Organisms_Drosophila /home/rstudio/rnaseq/2-model-org-dmel
    ln -s /home/rstudio/cmoor-files/tutorials/Biological_Databases_Intro /home/rstudio/rnaseq/3-intro-db
    ln -s /home/rstudio/cmoor-files/tutorials/Biological_Databases_FlyBase /home/rstudio/rnaseq/4-db-flybase
    ln -s /home/rstudio/cmoor-files/tutorials/Biological_Databases_HPA /home/rstudio/rnaseq/5-db-hpa
    ln -s /home/rstudio/cmoor-files/tutorials/Biotechnology_Next-Gen_Sequencing /home/rstudio/rnaseq/6-biotech-ngs
    ln -s /home/rstudio/cmoor-files/tutorials/Biotechnology_RNA-seq /home/rstudio/rnaseq/7-biotech-rnaseq
    ln -s /home/rstudio/cmoor-files/tutorials/Clovis_RNAseq_single_sample /home/rstudio/rnaseq/8-intro-rnaseq
    ln -s /home/rstudio/cmoor-files/tutorials/Differential_Expression /home/rstudio/rnaseq/9-diff-exp
    ln -s /home/rstudio/cmoor-files/tutorials/rna-seq-project-work /home/rstudio/rnaseq/10-rnaseq-proj

    cd /home/rstudio/16s
    
    ln -s /home/rstudio/cmoor-files/tutorials/explore-phyloseq/ /home/rstudio/16s/1-explore-ps
    ln -s /home/rstudio/cmoor-files/tutorials/analyze-phyloseq/ /home/rstudio/16s/2-analyze-ps
    ln -s /home/rstudio/cmoor-files/tutorials/16S-amplicon-project-work/ /home/rstudio/16s/3-16s-project

    cd /home/rstudio/ABRCMS
    /home/rstudio/cmoor-files/tutorials/test_driveR /home/rstudio/ABRCMS
    mv test_driveR.Rmd rnaseq_sample.Rmd

   


