# -*- coding: utf-8 -*-
"""
1. Escribe una función, sum_num_list(numeros), que sume todos los números
de una lista. Compara el tiempo entre usar o no range.

@author: David Criado Ramón.
"""

import generar_lista
import time

def sum_num_list(numeros):
    """
    Suma todos los números presentes en la lista
    numeros. Versión con range
    """
    suma = 0
    for i in range(len(numeros)):
        suma += numeros[i]
        
    return suma

def sum_num_list_sin_range(numeros):
    """
    Suma todos los números presentes en la lista
    numeros. Versión con el operador in.
    """
    suma = 0
    for numero in numeros:
        suma += numero
        
    return suma

if __name__ == '__main__':
    lista = generar_lista.generar_lista(1000000)
    tiempo_antes = time.time()
    salida = sum_num_list(lista)
    tiempo_despues = time.time()
    tiempo = tiempo_despues - tiempo_antes
    print(f'La versión con range ha tardado {tiempo} s y suma {salida}')
    tiempo_antes = time.time()
    salida = sum_num_list_sin_range(lista)
    tiempo_despues = time.time()
    tiempo = tiempo_despues - tiempo_antes
    print(f'La versión sin range ha tardado {tiempo} s y suma {salida}')
    

