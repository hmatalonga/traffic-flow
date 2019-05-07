import numpy as np
import pandas as pd


def typecast_objects(gl_obj):
    gl_obj = gl_obj.apply(lambda x: x.str.strip())
    gl_obj = gl_obj.apply(lambda x: x.str.lower())
    
    converted_obj = pd.DataFrame()
    
    for col in gl_obj.columns:
        num_unique_values = len(gl_obj[col].unique())
        num_total_values = len(gl_obj[col])
        if num_unique_values / num_total_values < 0.5:
            converted_obj.loc[:, col] = gl_obj[col].astype('category')
        else:
            converted_obj.loc[:, col] = gl_obj[col]
    
    return converted_obj


def downcast(df):
    df_int = df.select_dtypes(include=['int'])
    converted_int = df_int.apply(pd.to_numeric, downcast='unsigned')
    
    df_float = df.select_dtypes(include=['float'])
    converted_float = df_float.apply(pd.to_numeric, downcast='float')

    df_obj = df.select_dtypes(include=['object'])
    converted_obj = typecast_objects(df_obj)

    df[converted_int.columns] = converted_int
    df[converted_float.columns] = converted_float
    df[converted_obj.columns] = converted_obj
    
    return df