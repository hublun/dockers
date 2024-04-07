#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.


FROM drclab/rstan:2.32.6
#-------------------------------------------------
ENV DEFAULT_USER=drudio
#-------------------------------------------------
RUN apt install sudo
#-------------------------------------------------
ADD scripts/default_user.sh /home/drclab/drudio.sh
RUN /home/drclab/drudio.sh
#-------------------------------------------------
ADD scripts/install_rstudio.sh /home/drclab/rstudio.sh
RUN /home/drclab/rstudio.sh
#-----------------------------------------------------
#USER ${DEFAULT_USER}

EXPOSE 8787
CMD rserver --server-daemonize 0