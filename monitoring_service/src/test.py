import evidently
from evidently.calculation_engine import *
from evidently import metrics
from evidently.collector import *

# Kiểm tra nội dung của metrics
print("Metrics contents:")
print(dir(metrics))

# Kiểm tra nội dung của calculation_engine
print("\nCalculation Engine contents:")
print(dir(calculation_engine))

# Kiểm tra nội dung của collector
print("\nCollector contents:")
print(dir(collector))
