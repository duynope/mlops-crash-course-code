import pandas as pd

# Đọc file Parquet
df = pd.read_parquet('/home/duy/mlops-crash-course/mlops-crash-course-code/monitoring_service/data/mock_drift_data.parquet')

# Hiển thị thông tin cơ bản về dữ liệu
print(df.info())

# Hiển thị một vài dòng dữ liệu
print(df.head())
