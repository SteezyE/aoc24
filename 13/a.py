#!/usr/bin/python3

from scipy.optimize import linprog
import sys
import re

v = []
total = 0
EPS = 1e-5
for line in sys.stdin:
    if line[0].isupper():
        v.append(list(map(int,re.findall(r'\d+', line))))
        if len(v) == 3:
            c = [3, 1]
            A = [[v[0][0], v[1][0]], [v[0][1], v[1][1]]]
            b = v[2] 

            x0 = (0, 100)
            x1 = (0, 100)

            res = linprog(c, A_eq=A, b_eq=b, bounds=[x0, x1], method='highs')
            if res.success and abs(round(res.x[0]) - res.x[0]) <= EPS and abs(round(res.x[1]) - res.x[1]) <= EPS:
                total += round(res.x[0])*3+round(res.x[1])
            v = []
print(total)
