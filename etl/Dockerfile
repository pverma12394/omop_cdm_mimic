# Use an appropriate base image
FROM ubuntu:20.04

# Set non-interactive frontend
ARG DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
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

# Set timezone to avoid interactive prompt
RUN ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata

RUN curl -s https://get.nextflow.io | bash \
 && mv nextflow /usr/local/bin/

# Install dbt and other Python dependencies
RUN pip3 install --upgrade pip \
    && pip3 install dbt-mysql ydata-profiling

# Configure MySQL root password
ENV MYSQL_ROOT_PASSWORD=password

# Set MySQL root password
RUN service mysql start && \
    sleep 10 && \
    mysql --user=root --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY '${MYSQL_ROOT_PASSWORD}';" && \
    mysql --user=root --password="${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# Set environment variables
ENV DBT_PROFILES_DIR=/usr/app/dbt

# Copy project files
COPY . /usr/app

EXPOSE 3306
EXPOSE 8000

# Set work directory
WORKDIR /usr/app

CMD service mysql start && nextflow run main.nf --with-dag dbt.html


