#!/usr/bin/env bash
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
    R -e "remotes::install_github('C-MOOR/SchaumOrganData')"

