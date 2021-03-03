FROM rocker/shiny-verse:4.0.3

RUN apt-get update && apt-get install -y git libglpk-dev

RUN R -q -e "install.packages(c('learnr', 'BiocManager'))" && \
 R -q -e "BiocManager::install(c('DESeq2', 'clusterProfiler', 'org.Dm.eg.db'))"

COPY tutorials/ /opt/clovis-biol11a/tutorials

RUN useradd -m idies && \
    rm -rf /srv/shiny-server && \
    mkdir -p /srv/shiny-server/ && cd /srv/shiny-server/ && \
    mkdir Intro_R Intro_RNA-seq Differential_Expression FlyBase && \
    chmod a+w Intro_R Intro_RNA-seq Differential_Expression FlyBase && \
    cp /opt/clovis-biol11a/tutorials/Clovis_Intro_R.Rmd Intro_R && \
    cp /opt/clovis-biol11a/tutorials/Clovis_RNAseq_single_sample.Rmd Intro_RNA-seq && \
    cp /opt/clovis-biol11a/tutorials/Clovis_Differential_Expression.Rmd Differential_Expression && \
    cp /opt/clovis-biol11a/tutorials/FlyBase.Rmd FlyBase && \
    chown -R idies /srv/shiny-server/ /var/log/shiny-server /var/lib/shiny-server/

COPY sciserver/shiny-server.conf /etc/shiny-server/shiny-server.conf

COPY sciserver/startup.sh /opt/startup.sh
EXPOSE 8888

USER idies

CMD /bin/bash
