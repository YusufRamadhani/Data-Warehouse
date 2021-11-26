# DATA WAREHOUSE    

In this project I'm trying to practice docker with a implementation of Data Warehouse. The image I use is Postgresql:13 and apache/airflow:2.1.3

You can use this repo for your project if you going to practice using Postgres, Airflow, Hadoop, and Hive (single node).

## About the Project

This project will be Big Data environment contains Airflow, Postgres and Hive. Environment will be deploy with docker-compose. For dataset available in postgres with database name 'pagila' (sakila dataset for postgres version). You could use pagila as source data to perform an ETL using Airflow and store it in Hive.

Docker-compose will deploy with three container which is postgres, aiflow scheduler, and airflow webserver. Hive and Hadoop installed in airflow webserver container. 

I know the webserver container will be significant large, but if you have limited resource like I did. It should be enough running Airflow `LocalExecutor` tho.

### Tech stack

### What I'he learned

## How to Install

### How to Use

### Using in vs code


## Troubleshooting

