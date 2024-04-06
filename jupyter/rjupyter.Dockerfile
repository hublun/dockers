#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
ARG PWD=dulun8686

FROM drclab/rstan:2.32.6

RUN apt install sudo

RUN useradd -s /bin/bash -m -d /home/drupyter/ -G sudo drupyter \
  	# && usermod -a -G sudo drupyter    
      && echo "drupyter:dulun8686" | chpasswd

RUN apt update \
      && apt install -y --no-install-recommends python3-pip \
      r-cran-irkernel
      #r-cran-languageserver



RUN Rscript -e 'install.packages("languageserver")'
# RUN Rscript -e 'install.packages("IRkernel")'


RUN pip3 install jupyterlab jupyterlab-lsp

USER drupyter

RUN jupyter lab --generate-config
RUN Rscript -e 'IRkernel::installspec()'


ENV USER=drupyter
ENV PASSWORD=$PWD

EXPOSE 8686
CMD jupyter lab --ip=0.0.0.0 \
                  --NotebookApp.token=${PASSWORD} \
                  --port=8686 \
                  --no-browser \
                  --notebook-dir=/home/${USER}
# CMD ["jupyter", "lab", \
#  "--ip=0.0.0.0", "--kernel=ir" ,"--no-browser" ,\
#  "--port=8686", "--notebook-dir", "/home/drupyter", \
#  "--NotebookApp.token", "dulun8686"]