#!/bin/bash
psql -U postgres -d etl_test -f ./utils/schema_creation.sql

psql -U postgres -d etl_test -f ./utils/vocab_schema.sql
