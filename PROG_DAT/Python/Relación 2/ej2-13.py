# -*- coding: utf-8 -*-
"""
13. Un vector disperso es aquel que tiene muchos elementos nulos. Para ese tipo
de vectores, la representación más adecuada es guardar únicamente los elementos
no nulos. Escribe una función, dispersa(v) a la que se le pase una lista
representando el vector disperso y que devuelva el número de elementos del
vector junto con una lista de pares (pos, elem) con cada una de las posiciones
en las que hay un elemento no nulo y el elemento. Ejemplo:
[1, 0, 0, 5, 4, 0, 0, 0] => ([(0, 1), (3, 5), (4,4)], 8)

@author: David Criado Ramón.
"""

from generar_lista import generar_lista

def dispersa(v):
    """
    Esta función genera un vector disperso a partir de un vector normal en
    forma de lista numérica. La salida será una dupla cuyo primer elemento será
    una lista de duplas (posición, elemento) para todos los elementos de la
    lista distintos de 0, el segundo elemento será el tamaño del vector.
    """
    return ([(i, v[i]) for i in range(len(v)) if v[i] != 0], len(v))

if __name__ == '__main__':
    lista = [1, 0, 0, 5, 4, 0, 0, 0]
    print(lista)
    print(dispersa(lista))
    
    lista = generar_lista(7)
    lista[3] = 0
    lista[-1] = 0
    print(lista)
    print(dispersa(lista))