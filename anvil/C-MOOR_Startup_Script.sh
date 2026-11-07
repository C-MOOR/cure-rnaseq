#!/usr/bin/env bash
    # Terra reccomended us to use set -e which will prevent the environment from loading in if a package is not detected
    # But I think this will cause an error if any of the following commands fail and freeze the environment.
    # Except the packages, most errors should be immediately visible to the student in the file explorer.
    # So for now, I think we should not include set -e.
    # set -e
    cd /home/rstudio

    #Copy the packages' preinstalled files from the tarball
    gcloud storage cp "gs://fc-4ab085c4-7fc5-45f2-aa38-b853e928c207/C-MOOR_Packages.tar.gz" /home/rstudio
    #Note that Bioconductor 3.21 loads with the linux libraries as 4.5-3.20. Future Bioconductor versions may change this path.
    tar -zxvf C-MOOR_Packages.tar.gz -C /home/rstudio/R/x86_64-pc-linux-gnu-library/4.5-3.20 --overwrite
    rm C-MOOR_Packages.tar.gz

    #Copy the learnr modules from GitHub
    git clone https://github.com/c-moor/cure-rnaseq/ /home/rstudio/cure-rnaseq
    chown -R 1000 /home/rstudio/cure-rnaseq
    mv cure-rnaseq cmoor-files
    
    #Reorganize the modules into miniCURE curricula and samples 
    cd /home/rstudio
    chown -R 1000 /home/rstudio
    mkdir rnaseq
    mkdir 16s
    mkdir samplers
    chown -R 1000 /home/rstudio/16s
    chown -R 1000 /home/rstudio/rnaseq
    chown -R 1000 /home/rstudio/samplers

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

    cd /home/rstudio/samplers
    ln -s /home/rstudio/cmoor-files/tutorials/16S_Sampler/ /home/rstudio/samplers/16S_Sampler
    ln -s /home/rstudio/cmoor-files/tutorials/test_driveR/ /home/rstudio/samplers/RNA-seq_Sampler
    
#Code for catching any errors in package installation    
    
# 1. Define the packages we want to test
my_packages=(
    "learnr"
    "clusterProfiler"
    "org.Dm.eg.db"
    "org.Mm.eg.db"
    "phyloseq"
    "DOSE"
    "DESeq2"
    "testdriveRData"
    "MarianesMidgutData"
    "GuthrieMisoData"
    "SharonBrainData"
    "HumanGutMicrobiomeData"
    "SchaumOrganData"
)

# 2. Check each package completely silently. R will NEVER throw an error or exit non-zero.
# requireNamespace checks whether the package can be run without attaching it to the R environment.
# It checks not only if the package files exist but if they compile and if all dependencies are available
FAILED_PACKAGES=""
for pkg in "${my_packages[@]}"; do
    # requireNamespace returns TRUE/FALSE silently. We print "MISSING" if it's not there.
    CHECK_RESULT=$(Rscript -e "cat(if(requireNamespace('$pkg', quietly=TRUE)) 'OK' else 'MISSING')")
    
    if [ "$CHECK_RESULT" = "MISSING" ]; then
        FAILED_PACKAGES="$FAILED_PACKAGES $pkg"
    fi
done

# 3. If any package failed, place a visible warning block inside their terminal console
# If there are any packages that returned MISSING, it will give this message to the student.
if [ ! -z "$FAILED_PACKAGES" ]; then
    
    # Target the student's personal home profile path
    r_profile="/home/rstudio/.Rprofile"
    
    # We write clean terminal messages (NO hard stop codes that cause app failures)
    cat << 'EOF' > "$r_profile"

# Clear the console screen to ensure they only see your message
cat("\014") 

cat("\n")
cat("🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨\n")
cat("❌ [ERROR]: WORKSPACE SETUP FAILED\n")
cat("🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨\n\n")
cat("Dear Student,\n")
cat("One or more required software libraries failed to configure properly.\n")
cat("This environment may not have all the tools you need to use the modules.\n")
cat("This occasionally occurs during an error while setting up the environment.\n")
cat("Please shut down this RStudio environment and create a new one from scratch.\n\n")
cat("Thank you for your understanding.\n")

# Redefine the return key to freeze execution and print the error if they try typing
lock_environment <- function(...) {
    cat("\n❌ ENVIRONMENT LOCKED: Please delete this workspace as instructed above.\n")
}
makeActiveBinding("print", lock_environment, .GlobalEnv)
EOF

    # Fix permissions so the user session can read it freely
    chown rstudio:rstudio "$r_profile" 2>/dev/null
fi

# 4. ALWAYS EXIT 0. No process has failed at a system level, so Leonardo stays unlocked.
# If exit is not set to 0, Leonardo error 500 (Google Cloud/Terra issue) will show.
# This will crash the environment and prevent it from being deleted by the student and must be deleted by the instructor.
# In addition, a slight delay will mean the instructor is not able to delete the environment right away.
exit 0
