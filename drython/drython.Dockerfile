FROM ubuntu:24.04
#-----------------
RUN apt update \
    && apt full-upgrade -y \
    && apt install -y sudo
#--------------default user -------------
ENV DEFAULT_USER=ubuntu
WORKDIR /drclab/
ADD scripts/users/change_ubuntu_pwd.sh .
RUN chmod u+x ./change_ubuntu_pwd.sh \
    && ./change_ubuntu_pwd.sh \
    && rm -rf change*.sh \
    && apt install -y build-essential
#----------------------------------------
ADD scripts/langs/install_python.sh ./py.sh
RUN ./py.sh
RUN rm -rf ./py.sh
#----------------------------------------
USER ${DEFAULT_USER}
#----------------------------------------