# DATA WAREHOUSE    

In this project I'm trying to practice docker with a implementation of Data Warehouse. The image I use is Postgresql:13 and apache/airflow:2.1.3

You can use this repo for your project if you going to practice using Postgres, Airflow, Hadoop, and Hive (single node).

## About the Project

This project will be Big Data environment contains Airflow, Postgres and Hive. Environment will be deploy with docker-compose. For dataset available in postgres with database name 'pagila' (sakila dataset for postgres version). You could use pagila as source data to perform an ETL using Airflow and store it in Hive.

Docker-compose will deploy with three container which is postgres, aiflow scheduler, and airflow webserver. Hive and Hadoop installed in airflow webserver container. I know the webserver container will be significantly large, but if you have limited resource like I did. It should be enough running Airflow `LocalExecutor` tho.

### Tech stack

* Postgres:13
* Airflow:2.1.3
* Hadoop:2.10.1
* Hive:2.3.7

Additional lib and tools
* jupyterlab
* pytest

### What I've learned

1. How to Create database and dump some data to the database using docker-compose and command line (while building container)
2. Extend and Customize the image especially airflow image that I heavily edit.
3. Tuning the airflow as I needed.

## Installation
### Build the image 

Build your image first

```sh
$ docker-compose build
```

or you can use docker build command as usual. then edit docker-compose image to the image you just build.
If you need additional or more customization, you could use `--build-arg`. Something like below

```sh
$ docker-compose build --build-arg ADDITIONAL_AIRFLOW_EXTRAS="apache-airflow-providers-apache-hive" \
 --build-arg ADDITIONAL_DEV_APT_DEPS="git"
```

### Initialize Environment

You need to prepare the environment, i.e. create files and directory you needed, or initialize database. On Linux volumes that mounted to container using native Linux filesystem user and group permission. So you have to make sure the container and host have matching file permission.

```sh
$ mkdir -p ./dags ./logs ./plugins 
$ echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env
```

On all operating systems, you need to run database migrations and create the first user account. To do it, run.

```
$ docker-compose up airflow-init
```

### Running services

Now you can start all services.

```
$ docker-compose up
```

### Cleaning up environment

To stop and delete containers, volumes and images.

```
$ docker-compose down --volume --rmi all
```

## How to Use

All services already run and you could access it in localhost like airflow webserver in port 8080.

Airflow username: Airflow
Airflow password: Airflow

Postgres username: Airflow
Postgres password: Airflow
Postgres database(data source): pagila

For jupyterlab you should start from inside container.

```
$ docker-composer run airflow-webserver jupyter lab
```

## Using in vs code

If you are using vscode and going to work in vscode. You should use Remote-Container in vscode. You can set your workspace inside container. 

This repo include .devcontainer you can reopen the vscode in container after you running all service in docker-compose.

## Troubleshooting

For error like 'permission denied' while running container or make changes. You should make sure that pid:gid you use is same in host and container. (container airflow-webserver user is 'airflow' with pid:gid like in file .env)

If above not helping error 'permission denied'. You may edit file .env to matching pid or just use pid=50000 (default value for user airflow).
