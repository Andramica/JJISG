import os
import pandas as pd
import numpy as np

wd = os.path.abspath(os.path.join(os.getcwd(), os.pardir)) + "/data/"

brand_detection = pd.read_csv(wd + '/csv/brand_detection.csv', encoding='utf-8', dtype=object)
img_list_batch_01 = pd.read_csv(wd + '/csv/img_list_batch_01.csv', encoding='utf-8', dtype=object)
master_data = pd.read_csv(wd + '/csv/master_data.csv', encoding='utf-8', dtype=object)

brand_detection['confidence'] = pd.to_numeric(brand_detection['confidence'])
passed = brand_detection['confidence'] > 0.8
brand_detection = brand_detection[passed]
brand_detection = brand_detection.groupby(['file_num', 'label'])['confidence'].median().reset_index()

df = pd.merge(img_list_batch_01, master_data, on='taskid', how='left')

df['filename'] = df['filename'].str.split('.').str.get(0)
brand_detection['file_num'] = brand_detection['file_num'].str.split('.').str.get(0)

df = pd.merge(brand_detection, df, on='file_num', how='left')

df = df[pd.notnull(df['filename'])]

df.to_csv(wd + 'rpt_sfa_pm.csv', encoding='utf-8')
