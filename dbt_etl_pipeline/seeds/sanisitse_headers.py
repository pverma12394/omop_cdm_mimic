import re
import pandas as pd

def sanitize_dataframe_column_names(df):
    """
    Sanitize the column names of a pandas DataFrame by replacing special characters and spaces with underscores.
    Consecutive special characters are replaced with a single underscore.
    
    Args:
    df (pd.DataFrame): The DataFrame whose column names need to be sanitized.
    
    Returns:
    pd.DataFrame: The DataFrame with sanitized column names.
    """
    def sanitize_column(col_name):
        # Replace any sequence of special characters or spaces with a single underscore
        sanitized_col = re.sub(r'[^\w]+', '_', col_name).lower()
        # Remove leading or trailing underscores
        sanitized_col = sanitized_col.strip('_')
        return sanitized_col
    
    # Apply the sanitization function to each column name
    df.columns = [sanitize_column(col) for col in df.columns]
    
    return df

# Sanitize the column names
svs_metadata = pd.read_csv("seeds/svs_metadata.csv")
sanitized_df = sanitize_dataframe_column_names(svs_metadata)

print("Sanitized Column Names: ", sanitized_df.columns)
sanitized_df.to_csv("svs_metadata.csv", index=False)