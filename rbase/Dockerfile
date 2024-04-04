## Emacs, make this -*- mode: sh; -*-

FROM ubuntu:24.04

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
      org.opencontainers.image.source="https://github.com/rocker-org/rocker" \
      org.opencontainers.image.vendor="Rocker Project" \
      org.opencontainers.image.authors="Dirk Eddelbuettel <edd@debian.org>"

# Creates a new user account with the username "dulun".
# Sets the default login shell for the user to /bin/bash. This means that when the user logs in, they will be presented
# with the Bash shell, which is the most commonly used shell in Linux.
# The -m option tells the useradd command to create a home directory for the new user. The home directory will be 
# located at /home/dulun by default, unless specified otherwise.

# The usermod command is used to modify an existing user account.
# The -a option stands for "append" and is used to add the user to the specified group(s) without removing them from their current groups.
# The -G option is used to specify the additional group(s) that the user should be added to.
# In this case, the user "drclab" is being added to the "owner" group.

RUN useradd -s /bin/bash -m drclab \
 	&& usermod -a -G adm drclab

# ## NB: No 'apt-get upgrade -y' in official images, see eg

RUN apt-get update \
	&& apt-get upgrade -y \
 	&& apt-get install -y --no-install-recommends \
		python3-pip \
		python3-dev \
		python3-cryptography \
 		ed \
 		less \
 		locales \
 		nano \
 		wget \
 		ca-certificates \
 		fonts-texgyre
 	#&& rm -rf /var/lib/apt/lists/*

# ## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
 	&& locale-gen en_US.utf8 \
 	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

# ## Use Debian unstable via pinning -- new style via APT::Default-Release
# RUN echo "deb http://http.debian.net/debian sid main" > /etc/apt/sources.list.d/debian-unstable.list \
#         && echo 'APT::Default-Release "testing";' > /etc/apt/apt.conf.d/default \
#         && echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf.d/90local-no-recommends

ENV R_BASE_VERSION 4.3.3

# # ## During the freeze, new (source) packages are in experimental and we place the binaries in our PPA
# RUN echo "deb http://deb.debian.org/debian experimental main" > /etc/apt/sources.list.d/experimental.list \
#      && echo "deb [trusted=yes] https://eddelbuettel.github.io/ppaR400 ./" > /etc/apt/sources.list.d/edd-r4.list

##------------------------------------------ Now install R and littler, and create a link for littler in /usr/local/bin----------------------
# The -t unstable option tells apt-get to install packages from the "unstable" (or "sid") distribution, rather than the default "stable" (or "bullseye")
# distribution. Using packages from the "unstable" distribution can be risky, as these are pre-release or nightly builds that may be less stable than the official "stable" releases. The search results recommend only using these for development or testing purposes, not for production systems.
# The --no-install-recommends option tells apt-get to only install the strictly required dependencies, and not any recommended packages. This can help reduce the number of packages installed, but may also remove some functionality.
# The -y option automatically answers "yes" to any prompts, allowing the installation to proceed without user interaction.
RUN apt-get install -y --no-install-recommends \
    libopenblas0-pthread \
    littler \
    r-cran-docopt \
    r-cran-littler \

# RUN apt-get install -y --no-install-recommends \    
#  		r-base=${R_BASE_VERSION}-*
 	&& chown root:adm "/usr/local/lib/R/site-library" \
 	&& chmod g+ws "/usr/local/lib/R/site-library" \
 	&& ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/installBioc.r /usr/local/bin/installBioc.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/installDeps.r /usr/local/bin/installDeps.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r


RUN apt-get install -y --no-install-recommends software-properties-common
RUN apt-get install -y --no-install-recommends build-essential
RUN apt-get install -y --no-install-recommends gfortran r-cran-matrix
RUN apt-get install -y --no-install-recommends r-cran-ggplot2
RUN apt-get install -y --no-install-recommends r-cran-rstan \
 	&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
 	&& rm -rf /var/lib/apt/lists/*

# RUN add-apt-repository ppa:marutter/rrutter4.0 -y \
#       && add-apt-repository ppa:c2d4u.team/c2d4u4.0+ -y \
#       && apt-get update
     # \
     #&& apt-get install -y --no-install-recommends r-cran-rstan

#RUN rm -rf /var/lib/apt/lists/*
# COPY install_R_packs.R .
# RUN Rscript install_R_packs.R
#CMD ["bash"]
 	# && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
#&& rm -rf /var/lib/apt/lists/*
#ENTRYPOINT ["bash", "-c", "echo !!! Welcome to DRC Lab www.dulun.com !!!"]
