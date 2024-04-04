#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

ARG BASE_IMAGE=rocker/rstudio:4.3.3
FROM ${BASE_IMAGE}
#FROM ${BASE_IMAGE}:jammy

ARG R_VERSION=4.3.3
ARG OS_IDENTIFIER=ubuntu-2204
ARG MY_VAR="dulun"
ENV PASSWORD=$MY_VAR

# Install R
#RUN   
    #wget https://cdn.posit.co/r/${OS_IDENTIFIER}/pkgs/r-${R_VERSION}_1_amd64.deb && \
RUN     apt-get update -qq
        #apt-get upgrade
#     DEBIAN_FRONTEND=noninteractive apt-get install -f -y ./r-${R_VERSION}_1_amd64.deb && \
#     ln -s /opt/R/${R_VERSION}/bin/R /usr/bin/R && \
#     ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/bin/Rscript && \
#     ln -s /opt/R/${R_VERSION}/lib/R /usr/lib/R && \
#     rm r-${R_VERSION}_1_amd64.deb && \
#     rm -rf /var/lib/apt/lists/*

#CMD ["rstudio"]