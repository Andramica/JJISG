import os
import pandas as pd
import numpy as np

wd = os.path.abspath(os.path.join(os.getcwd(), os.pardir)) + "/data/csv/"

v_fct_salesrep_activity = pd.read_csv(wd + 'v_fct_salesrep_activity.csv', encoding='utf-8', dtype=object)
v_fct_task = pd.read_csv(wd + 'v_fct_task.csv', encoding='utf-8', dtype=object)
v_md_customer = pd.read_csv(wd + 'v_md_customer.csv', encoding='utf-8', dtype=object)
v_md_mastertask = pd.read_csv(wd + 'v_md_mastertask.csv', encoding='utf-8', dtype=object)
v_md_salescampaign = pd.read_csv(wd + 'v_md_salescampaign.csv', encoding='utf-8', dtype=object)
v_md_salescycle = pd.read_csv(wd + 'v_md_salescycle.csv', encoding='utf-8', dtype=object)

df = pd.merge(v_fct_task, v_fct_salesrep_activity, on='customerid', how='left')
df = pd.merge(df, v_md_customer, on='customerid', how='left')
df = pd.merge(df, v_md_mastertask, on='mastertaskid', how='left')
df = pd.merge(df, v_md_salescampaign, on='salescampaignid', how='left')
df = pd.merge(df, v_md_salescycle, on='salescycleid', how='left')

df['sales_office'] = np.nan
df['mrchr_visitdate'] = np.nan
df['filepath'] = np.nan
df['brandname'] = np.nan

cols_to_drop = ['customerid', 'salescampaignid', 'mastertaskid', 'salescycleid',
                'country', 'county', 'district', 'city', 'postcode', 'streetname', 'streetnumber']

df = df.drop(cols_to_drop, axis=1)
df = df[pd.notnull(df['taskid'])]
df = df.drop_duplicates(keep='first')

df.to_csv(wd + 'master_data.csv', encoding='utf-8')
