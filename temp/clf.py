#coding=utf-8
import numpy as np
import matplotlib.pyplot as plt
from sklearn.mixture import GMM

np.set_printoptions(threshold=np.nan)
X = np.loadtxt('result2.csv', delimiter = "," , usecols=(3,4))
gmm = GMM(n_components=5).fit(X)

y_pred = gmm.predict(X)


x_type = np.loadtxt('result2.csv', delimiter = "," , usecols=(5,))


plt.subplot(2, 1, 1)
plt.scatter(X[:, 1], X[:, 0], c=y_pred)
#plt.show()
       
plt.subplot(2, 1, 2)
plt.scatter(X[:, 1], X[:, 0], c=x_type, cmap='viridis')
plt.show()    
 



