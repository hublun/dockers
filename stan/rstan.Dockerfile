#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM drclab/rjammy:4.3.3

RUN apt update \
    && apt install -y --no-install-recommends r-base-dev
COPY stan/install_R_packs.R /home/drclab/install_R_packs.R
RUN R < /home/drclab/install_R_packs.R --no-save