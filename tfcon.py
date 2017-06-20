#coding=utf-8
import numpy as np
from scipy.fftpack import fft,ifft
import matplotlib.pyplot as plt
import os
import pulsepro as ppr

def get_nmin(seg):
    if seg[0] < seg[1]:
       return 1
    else:
       i = 1
       while (i < 9):
         if (seg[i] < seg[i+1]) and (seg[i] < seg[i-1]):
            return i + 1
         i = i + 1
       return i + 1

np.set_printoptions(threshold=np.nan)

#for filename in os.listdir(r'python'):
#    print filename

text = np.loadtxt('20150812012 - 谢粉珍 - 右.txt')
min_r = ppr.seg_pulse(text)
N_r = np.shape(min_r)[0]


result = np.empty(0, int)
for j in range(N_r - 1):
   xx = text[min_r[j]:(min_r[j+1]+1)]
   y1 = abs(fft(xx))
   mi = get_nmin(y1) 
   result = np.append(result, mi)

print result

pwv_dis = ppr.nmin_majority(result)
print pwv_dis

plt.plot(text, 'r')
plt.show()
