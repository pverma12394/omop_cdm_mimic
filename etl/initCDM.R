# install.packages("devtools")
# devtools::install_github("OHDSI/CommonDataModel")
# install.packages("DatabaseConnector")

library(CommonDataModel)
library(DatabaseConnector)

## buildRelease function allows the user to fetch the DDLs for the specified CDM version.
## The DDL can be stored in a temporary location initialised in the code below

buildRelease(cdmVersions = "5.4",
              targetDialects = "postgresql",
              file.path(tempdir(), "inst", "ddl")
             )

## In order to create the tables, you will need to specify an empty schema in your database
## In this case, we have create an empty schema in the ohdsi database called ohdsi_demo

cd <- createConnectionDetails(dbms = "postgresql",
                                server = "localhost/ohdsi",
                                user = "demo",
                                password = "root",
                                pathToDriver = "jar/"
                              )

executeDdl(connectionDetails = cd,
			cdmVersion = "5.4",
			cdmDatabaseSchema = "ohdsi_demo"
        )



