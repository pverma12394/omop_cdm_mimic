# generate_report.py

import sys
from jinja2 import Environment, FileSystemLoader
from constants import TABLES_METRICS_PRE_QC, TABLES_METRICS_POST_QC, SCHEMA_PRE_QC, SCHEMA_POST_QC
from db import read_table

def fetch_qc_metrics(table_name, mappings, schema):
    qc_data = {}
    metrics = mappings.get(table_name, {}).get('qc', {})
    
    for metric, table in metrics.items():
        df = read_table(table, schema)
        qc_data[metric] = df.to_dict(orient='records')
    
    return qc_data

def process_tables(mode):
    # Choose the correct mappings and schema based on the mode
    if mode == 'pre':
        mappings = TABLES_METRICS_PRE_QC
        schema = SCHEMA_PRE_QC
    elif mode == 'post':
        mappings = TABLES_METRICS_POST_QC
        schema = SCHEMA_POST_QC
    else:
        print("Invalid mode. Please use 'pre' or 'post'.")
        sys.exit(1)

    report_data = {}
    
    # Iterate over all table names and fetch their QC metrics
    for table in mappings.keys():
        qc_metrics = fetch_qc_metrics(table, mappings, schema)
        report_data[table] = {
            'qc': qc_metrics if qc_metrics else {},  # Ensure qc key exists
            'distribution': []  # Placeholder, no distribution in this case
        }

    return report_data

def render_report(report_data, mode):
    env = Environment(loader=FileSystemLoader('templates'))
    template = env.get_template('report_template.html')
    
    # Name the report based on the mode
    report_name = f"qc_report_{mode}.html"
    
    output = template.render(report_data=report_data)
    
    with open(report_name, 'w') as f:
        f.write(output)
    print(f"QC Report generated successfully as '{report_name}'.")

def main():
    if len(sys.argv) != 2:
        print("Usage: python generate_report.py <pre|post>")
        sys.exit(1)
    
    mode = sys.argv[1].lower()  # Get the mode (pre or post)
    
    report_data = process_tables(mode)
    render_report(report_data, mode)

if __name__ == "__main__":
    main()
