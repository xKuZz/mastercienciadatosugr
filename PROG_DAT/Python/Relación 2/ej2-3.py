# -*- coding: utf-8 -*-
"""
3 - Escribe una función, numeros_pares(numeros), que devuelva los números
pares que hay en una lista.

@author: David Criado Ramón.
"""
def numeros_pares(numeros):
    """
    Devuelve una lista con los números pares presentes en la lista.
    """
    pares = []
    for numero in numeros:
        if numero % 2 == 0:
            pares.append(numero)
            
    return pares

if __name__ == '__main__':
    lista = [1,2,3,4,5]
    pares = numeros_pares(lista)
    print(f'En la lista {lista}, {pares} son números pares.')
    lista = [2,4,6,8]
    pares = numeros_pares(lista)
    print(f'En la lista {lista}, {pares} son números pares.')
    lista = [1,3,5,7,9]
    pares = numeros_pares(lista)
    print(f'En la lista {lista}, {pares} son números pares.')
