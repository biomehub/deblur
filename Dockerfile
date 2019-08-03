FROM continuumio/miniconda3:latest
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER BiomeHub

LABEL version="1.1.0"
LABEL software.version="1.1.0"
LABEL software="deblur"

COPY environment.yaml ./

RUN conda env create -f environment.yaml

RUN echo "source activate deblurenv" > ~/.bashrc

ENV PATH /opt/conda/envs/deblurenv/bin:$PATH    
ENV export LC_ALL=C.UTF-8
ENV export LANG=C.UTF-8
 
