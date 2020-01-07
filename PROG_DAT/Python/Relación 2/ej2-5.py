# -*- coding: utf-8 -*-
"""
5 - Escribe una función, mezclar(la, lb), que dadas dos listas ordenadas,
devuelva una lista conteniendo los elementos de ambas listas de forma
ascendente.

@author: David Criado Ramón.
"""
import generar_lista

def mezclar(la, lb):
    """
    Devuelve la mezcla de dos listas que se encontraban ordenadas.
    La salida es una mezcla de los elementos de ambas listas manteniendo
    la relación de orden.
    """
    indice_a = 0
    indice_b = 0
    salida = []
    
    while indice_a < len(la) and indice_b < len(lb):
        if la[indice_a] <= lb[indice_b]:
            salida.append(la[indice_a])
            indice_a += 1
        else:
            salida.append(lb[indice_b])
            indice_b +=1
            
    if indice_a < len(la):
        salida.extend(la[indice_a:])
        
    if indice_b < len(lb):
        salida.extend(lb[indice_b:])
        
    return salida

if __name__ == '__main__':
    lista1 = sorted(generar_lista.generar_lista(5))
    lista2 = sorted(generar_lista.generar_lista(6))
    print(lista1)
    print(lista2)
    print(mezclar(lista1, lista2))
