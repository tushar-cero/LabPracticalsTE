import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
df = pd.read_csv('test.csv')
df
df.head(5)
df.tail(5)
df.describe()
df.shape
df.info()
df.columns

x = np.array([1,3,5,7])
y = np.array([7,3,2,1])
plt.plot(x,y)
plt.show
