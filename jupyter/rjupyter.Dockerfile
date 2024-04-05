#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM drclab/rstan:2.32.6

RUN apt update \
     && apt install -y --no-install-recommends python3-pip
RUN pip3 install jupyter-server
# COPY stan/install_R_packs.R /home/drclab/install_R_packs.R
# RUN R < /home/drclab/install_R_packs.R --no-save
EXPOSE 8686
CMD ["jupyter-server", "--allow-root", "--port=8686"]
