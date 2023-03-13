FROM rocker/shiny-verse:4.2.2

RUN apt-get update && apt-get install -y git libglpk-dev

RUN R -q -e "install.packages(c('learnr', 'BiocManager')); BiocManager::install(version = '3.16')" && \
 R -q -e "BiocManager::install(c('DESeq2', 'clusterProfiler', 'org.Dm.eg.db'))"

RUN useradd -m idies && \
    rm -rf /srv/shiny-server && \
    mkdir -p /srv/shiny-server/ && \
    chown -R idies /srv/shiny-server/ /var/log/shiny-server /var/lib/shiny-server/

COPY sciserver/shiny-server.conf /etc/shiny-server/shiny-server.conf

COPY sciserver/startup.sh /opt/startup.sh
EXPOSE 8888

USER idies
RUN cd /home/idies && \
    git clone https://github.com/C-MOOR/cure-rnaseq

CMD /bin/bash
