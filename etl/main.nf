#!/usr/bin/env nextflow

nextflow.enable.dsl=2

// Process to perform data profiling using a Python script
/*
process dataProfiling {
    container 'nextflow-dbt:latest' // Use the custom Docker image

    input:
    path data_files from file('src/data/*')

    output:
    path 'profiling_report.html' into profilingReport

    script:
    """
    python3 src/scripts/profiling.py --input $data_files --output profiling_report.html
    """
}
*/

// Process to run `dbt seed`
process dbtSeed {
    //input:
    //path profilingReport // Ensure profiling report is generated before this step
    script:
    """
    dbt seed --profiles-dir /usr/app/dbt --project-dir /usr/app/dbt
    """
}

// Process to run `dbt run`
process dbtRun {
    //input:
    //path profilingReport // Ensure profiling report is generated before this step
    
    script:
    """
    dbt run --profiles-dir /usr/app/dbt --project-dir /usr/app/dbt
    """
}

// Process to run `dbt compile`
process dbtCompile {
    //input:
    //path profilingReport // Ensure profiling report is generated before this step
    
    script:
    """
    dbt compile --profiles-dir /usr/app/dbt --project-dir /usr/app/dbt
    """
}

workflow {
    // First, perform data profiling
    //profilingReport = dataProfiling()

    // Then, run dbt commands in sequence
    dbtSeed()
    dbtRun()
    dbtCompile()
}
