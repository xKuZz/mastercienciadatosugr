# -*- coding: utf-8 -*-
"""
2 - Escribe una función, contar_numeros_impares(numeros), que cuente la 
cantidad de números impares que hay en una lista.

@author: David Criado Ramón.
"""

def contar_numeros_impares(numeros):
    """
    Devuelve la cantidad de números impares presentes en números.
    """
    impares = 0
    for numero in numeros:
        if numero % 2 == 1:
            impares += 1
            
    return impares

if __name__ == '__main__':
    lista = [1,2,3,4,5]
    num = contar_numeros_impares(lista)
    print(f'En la lista {lista} hay {num} números impares.')
    lista = [2,4,6,8]
    num = contar_numeros_impares(lista)
    print(f'En la lista {lista} hay {num} números impares.')
    lista = [1,3,5,7,9]
    num = contar_numeros_impares(lista)
    print(f'En la lista {lista} hay {num} números impares.')
    

