FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    tzdata \
    python3-pip \
    python3-dev \
    build-essential \
    libpq-dev \
    openjdk-11-jdk \
    mysql-server \
    mysql-client \
    curl \
    git \
    && apt-get clean

RUN ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata

RUN curl -fsSL https://get.nextflow.io | bash && mv nextflow /usr/local/bin/

RUN pip3 install --upgrade pip \
    && pip3 install dbt-mysql ydata-profiling

EXPOSE 3306

ENV DBT_PROFILES_DIR=/usr/app/dbt
ENV MYSQL_ROOT_PASSWORD=password

COPY db-init.sh /usr/local/bin/db-init.sh
RUN chmod +x /usr/local/bin/db-init.sh

COPY . /usr/app
WORKDIR /usr/app

ENTRYPOINT ["/usr/local/bin/db-init.sh"]

CMD ["nextflow", "run", "main.nf", "--with-dag", "dbt.html"]