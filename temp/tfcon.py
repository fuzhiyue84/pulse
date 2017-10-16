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
data = np.empty(0)


n = 1
for filename in os.listdir(r'a/python'):
    print filename
    print n
    sfile = 'a/python/' + filename
    text = np.loadtxt(sfile)
    min_r = ppr.seg_pulse(text)
    N_r = np.shape(min_r)[0]

    result = np.empty(0, int)
    for j in range(N_r - 1):
        xx = text[min_r[j]:(min_r[j + 1] + 1)]
        y1 = abs(fft(xx))
        if np.shape(y1)[0] > 10:
           mi = get_nmin(y1)
           result = np.append(result, mi)

    flag = ppr.nmin_majority(result)
    col = np.array([filename])
    col = np.append(col, flag)
    data = np.append(data, col)
    n = n + 1

final_data = np.reshape(data, (-1, 5))
np.savetxt('result.csv', final_data, fmt='%s,%s,%s,%s,%s', newline='\n')