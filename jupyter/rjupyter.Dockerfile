#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM drclab/rstan:2.32.6



RUN apt update \
      && apt install -y --no-install-recommends python3-pip
RUN pip3 install jupyter

USER drclab

RUN jupyter notebook --generate-config


EXPOSE 8686
CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser" ,"--port", "8686"]