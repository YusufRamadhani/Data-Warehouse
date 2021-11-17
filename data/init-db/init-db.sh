#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE pagila;
EOSQL

cat /docker-entrypoint-initdb.d/init-db/pagila-schema.sql | psql -U "$POSTGRES_USER" -d pagila

cat /docker-entrypoint-initdb.d/init-db/pagila-data.sql | psql -U "$POSTGRES_USER" -d pagila