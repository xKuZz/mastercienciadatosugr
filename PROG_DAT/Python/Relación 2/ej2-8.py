# -*- coding: utf-8 -*-
"""
8. Escribe una función, eliminar(l1, l2), que dadas dos listas devuelva una
lista en la que estén todos los elementos de l1 que no están en l2.
@author: David Criado Ramón.
"""
from generar_lista import generar_lista

def eliminar(l1, l2):
    """
    Devuelve una lista con los elementos de l1 que no están en l2.
    También se podría resolver con sets. No estoy seguro de si puedo usarlos.
    """
    return [x for x in l1 if x not in l2]

if __name__ == '__main__':
    lista1 = generar_lista(6)
    lista2 = generar_lista(5)
    print(lista1)
    print(lista2)
    print(eliminar(lista1, lista2))
