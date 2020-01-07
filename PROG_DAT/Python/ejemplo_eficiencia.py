# -*- coding: utf-8 -*-
"""
Editor de Spyder

Este es un archivo temporal.
"""

import random
import time

N = 100000

def generar_lista(n, lim1=1, lim2=-1) : 
    if (lim2 == -1) :
        lim2 = n + 500000
    l = []
    for i in range(n) :
        l.append(random.randint(lim1,lim2))
    
    return l

def generar_set(n, lim1=1, lim2=-1) : 
    if (lim2 == -1) :
        lim2 = n + 500000       
    l = set()
    for i in range(n) :
        l.add(random.randint(lim1,lim2))
    
    return l

l = generar_lista(N)
s = set(l)
# s = generar_set(N)
datos = generar_lista(N)

t0 = time.time()
num = 0
for i in datos :
    if i in l :
        num+= 1

print("Tiempo necesario para buscar ", N, "elementos en una lista:", time.time() - t0)

t0 = time.time()
num = 0
for i in datos :
    if i in s :
        num+= 1
        
print("Tiempo necesario para buscar ", N, "elementos en un set:", time.time() - t0)