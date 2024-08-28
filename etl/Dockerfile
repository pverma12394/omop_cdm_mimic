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

# Install dbt and other Python dependencies
RUN pip3 install --upgrade pip \
    && pip3 install dbt-mysql ydata-profiling

# Download and install Nextflow
RUN curl -o /usr/local/bin/nextflow -fsSL https://github.com/nextflow-io/nextflow/releases/download/v23.04.3/nextflow \
    && chmod +x /usr/local/bin/nextflow

# Set environment variables
ENV DBT_PROFILES_DIR=/usr/app/dbt

# Copy project files
COPY . /usr/app

EXPOSE 3306

# Set work directory
WORKDIR /usr/app

CMD ["mysql"]
