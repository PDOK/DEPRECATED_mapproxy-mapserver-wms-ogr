FROM scratch
LABEL PDOK dev <pdok@kadaster.nl>

 FROM pdok/mapserver-wms-ogr AS mapserver

 FROM pdok/mapproxy-gunicorn AS mapproxy

COPY --from=mapserver /usr/local/bin /usr/local/bin
COPY --from=mapserver /usr/local/lib /usr/local/lib

RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
        libpng16-16 \
        python-cairo \
        libfreetype6 \
        libjpeg62-turbo \
        libfcgi0ldbl \
        libfribidi0 \
        libgdal20 \
        libgeos-c1v5 \
        libglib2.0-0 \
        libproj12 \
        libxml2 \
        libxslt1.1 \
        libexempi3 \
        gettext-base \
        wget \
        gnupg && \
    rm -rf /var/lib/apt/lists/*
