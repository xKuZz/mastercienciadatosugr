# -*- coding: utf-8 -*-
"""
4. Escribir una función, combinar_listas(11, 12) que devuelva una lista que
esté formada por todos los elementos de l1 y, a continuación, todos los de l2.
Por ejemplo, combinar_listas([1,2,8], [5, 10])

@author: David Criado Ramón.
"""
import generar_lista

def combinar_listas(l1, l2):
    """
    Concatena los elementos de dos listas. Poniendo primero todos los elementos
    de l1 primero y los de l2 a continuación.
    Supongo que no puedo usar extend.
    """
    # Copiamos para que no se modifique l1
    salida = l1.copy()
    
    # Este for se puede modificar por salida.extend(l2)
    for elemento in l2:
        salida.append(elemento)
    
    return salida

if __name__ == '__main__':
    lista1 = generar_lista.generar_lista(3)
    lista2 = generar_lista.generar_lista(4)
    print(lista1)
    print(lista2)
    print(combinar_listas(lista1, lista2))
    