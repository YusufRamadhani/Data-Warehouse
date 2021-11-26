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

### What I'he learned

1. How to Create database and dump some data to the database using docker-compose and command line (while building container)
2. Extend and Customize the image especially airflow image that I heavily edit.
3. 

## How to Install

### How to Use

### Using in vs code


## Troubleshooting

