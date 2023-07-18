FROM r-base:latest
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libfreetype6-dev \
    libfribidi-dev \
    libharfbuzz-dev \
    git \
    libxml2-dev \
    make \
    libfontconfig1-dev \
    libicu-dev \
    pandoc \
    zlib1g-dev \
    libgit2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libcairo2-dev \
    libgdal-dev \
    gdal-bin \
    libproj-dev \
    cmake \
    libxt-dev \
    libudunits2-dev \
    libgeos-dev \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/* \
    && R -q -e 'install.packages(c("pak","curl"))'

COPY ./install_my_packages.R /
RUN R -q -e 'pak::pak("devtools")'
RUN Rscript /install_my_packages.R
RUN R -q -e 'install.packages("later",version="1.3.0")'
