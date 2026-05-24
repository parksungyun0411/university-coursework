import numpy as np
import scipy as sp
import pandas as pd

b = np.arange(12).reshape(4,3)
df = pd.DataFrame(b,columns=['X1','X2','X3'])
df.loc[1,['X1','X3']] = np.nan
df.loc[2,'X2'] = np.nan
df.loc[3,'X2'] = np.nan
df_f = df.fillna(df.mean())
print(df_f)