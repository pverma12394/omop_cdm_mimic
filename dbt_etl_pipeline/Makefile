.PHONY: up down run-dbt-docs dbt-seed dbt-run dbt-compile

up:
	docker-compose --project-name dbt_etl_pipeline up -d 

down:
	docker-compose down

dbt-seed:
	docker-compose --project-name dbt_etl_pipeline run dbt seed

dbt-run:
	docker-compose --project-name dbt_etl_pipeline run dbt run
	
dbt-compile:
	docker-compose --project-name dbt_etl_pipeline run dbt compile