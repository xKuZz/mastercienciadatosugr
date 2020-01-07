# -*- coding: utf-8 -*-
"""
10 - Escribe una función, parejas(lista), que calcule las parejas distintas
de valores que aparecen en una lista.

@author: David Criado Ramón.
"""
from generar_lista import generar_lista

def parejas(lista):
    """
    Entiendo que he de emparejar todos los elementos de la lista entre sí
    y hacer una muestra única de esas duplas. Estaría bien un ejemplo para
    enterder lo que se quiere hacer, es bastante ambigua la redacción. Entiendo
    que no puedo usar sets.
    Entiendo que la pareja (3,4) y la pareja (4,3) son la misma y he de
    quedarme con una de ellas.
    """
    # 1. Hacer las parejas. Cada pareja va a ser una dupla
    parejas = []
    for i in range(len(lista)):
        for j in range(i +1, len(lista)):
            # La metemos sólo si no estaba antes.
            contador = parejas.count((lista[i], lista[j]))
            contador += parejas.count((lista[j], lista[i]))
            if contador == 0:
                parejas.append((lista[i], lista[j]))
    
    return parejas

if __name__ == '__main__':
    lista = generar_lista(6)
    print(lista)
    print(parejas(lista))
    

