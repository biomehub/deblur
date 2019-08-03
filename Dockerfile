FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER BiomeHub

LABEL version="1.1.0"
LABEL software.version="1.1.0"
LABEL software="deblur"

RUN apt-get -y update; \
    apt-get -y upgrade
    
RUN apt-get install -y build-essential
    
RUN apt-get install -y wget unzip

RUN apt-get clean

RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN sh Miniconda3-latest-Linux-x86_64.sh -b; \
    /root/miniconda3/bin/conda create -y -n deblurenv python=3.5 numpy; \
	source activate deblurenv; \
	/root/miniconda3/bin/conda init bash; \

SHELL ["bash", "-lc"]

RUN conda install -c bioconda -c biocore -y  "VSEARCH=2.7.0" MAFFT=7.310 SortMeRNA=2.0 biom-format deblur; \
    export LC_ALL=C.UTF-8; \
	export LANG=C.UTF-8

ENV PATH /root/miniconda3/envs/deblurenv/bin/:$PATH