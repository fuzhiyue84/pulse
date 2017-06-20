#coding=utf-8
import numpy as np

def seg_pulse(text):
   l = np.shape(text)
   N = l[0]

   t = 170
   x1 = 0
   x2 = t

   m = np.empty(0, int)
   num = 0

   while (x1 < N):
      s = text[x1:x2]
      n_max = np.argmax(s)
      n_1 = x1 + n_max
      m = np.append(m, n_1)

      x1 = n_1 + (t / 2);
      x2 = x1 + t;
   
      if (num > 0) and (x2 - x1 > 100) and (x2 - x1 < 350): 
         t = m[num] - m[num - 1]

      if (x2 >= N):
         x2 = N - 1
   
      num = num + 1

   m_r = np.array([1])
   m_r = np.append(m_r, m)

   l_r = np.shape(m_r)
   N_r = l_r[0] - 1

   min_r = np.empty(0, int)

   for i in range(N_r):
      min_f = m_r[i]
      min_b = m_r[i+1] + 1
      seg = text[min_f:min_b]
      index = np.argmin(seg)
      index = index + min_f
      min_r = np.append(min_r, index)

   return min_r

def nmin_majority(text):
   flag = np.zeros((10,), dtype=np.int)
   num = np.shape(text)[0]
   for i in range(num):
      if (text[i] == 1):
         flag[0] = flag[0] + 1
      
      if (text[i] == 2):
         flag[1] = flag[1] + 1

      if (text[i] == 3):
         flag[2] = flag[2] + 1

      if (text[i] == 4):
         flag[3] = flag[3] + 1
      
      if (text[i] == 5):
         flag[4] = flag[4] + 1
      
      if (text[i] == 6):
         flag[5] = flag[5] + 1

      if (text[i] == 7):
         flag[6] = flag[6] + 1

      if (text[i] == 8):
         flag[7] = flag[7] + 1

      if (text[i] == 9):
         flag[8] = flag[8] + 1

      if (text[i] == 10):
         flag[9] = flag[9] + 1
   
   print flag
   n1 = np.argmax(flag)
   m1 = np.max(flag)
   
   flag[n1] = 0
   
   n2 = np.argmax(flag)
   m2 = np.max(flag)

   result = np.empty(0, int)
   result = np.append(result, n1+1)
   result = np.append(result, m1)
   result = np.append(result, n2+1)
   result = np.append(result, m2)
   return result

