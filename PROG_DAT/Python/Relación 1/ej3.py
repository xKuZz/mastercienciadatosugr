# -*- coding: utf-8 -*-
"""
3 - Escribe una función buscar(palabra, sub) que devuelva la posición en la
que se puede encontrar sub dentro de palabra o -1 en caso de que no esté.

@author: David Criado Ramón.
"""

def buscar(palabra, sub):
    """ 
    Devuelve la posición inicial en la que se puede encontrar sub dentro
    de palabra. Si no estuviese sub se devolverá -1.
    """
    return palabra.find(sub)

def buscar_v2(palabra, sub):
    """ 
    Devuelve la posición inicial en la que se puede encontrar sub dentro
    de palabra. Si no estuviese sub se devolverá -1.
    Versión menos eficiente buscando con bucle for.
    """
    
    for i in range(len(palabra) - len(sub)):
        for j in range(len(sub)):
            # Si llegamos al final de la subcadena y todos son iguales,
            # hemos encontrado la parte inicial de la subcadena.
            if palabra[i+j] == sub[j] and j == len(sub) - 1:
                return i
            # Si no son iguales las subcadenas avanzamos en palabra
            elif palabra[i+j] != sub[j]:
                break
            # En otro caso continuamos el bucle interno para comprobar
            # si es subcadena o no
            
    return -1
            
if __name__ == '__main__':
    print("VERSIÓN CON FIND")
    palabra = "abracadabra"
    sub = "cad"
    x = buscar(palabra, sub)
    print(f"La subcadena \"{sub}\" comienza en la posición {x} de la palabra" +
          f" \"{palabra}\".")
    sub = "abra"
    x = buscar(palabra, sub)
    print(f"La subcadena \"{sub}\" comienza en la posición {x} de la palabra" +
          f" \"{palabra}\".")
    palabra = ""
    x = buscar(palabra, sub)
    print(f"La subcadena \"{sub}\" comienza en la posición {x} de la palabra" +
          f" \"{palabra}\".")
    print("VERSIÓN CON BUCLE")
    palabra = "abracadabra"
    sub = "cad"
    x = buscar_v2(palabra, sub)
    print(f"La subcadena \"{sub}\" comienza en la posición {x} de la palabra" +
          f" \"{palabra}\".")
    sub = "abra"
    x = buscar_v2(palabra, sub)
    print(f"La subcadena \"{sub}\" comienza en la posición {x} de la palabra" +
          f" \"{palabra}\".")
    palabra = ""
    x = buscar_v2(palabra, sub)
    print(f"La subcadena \"{sub}\" comienza en la posición {x} de la palabra" +
          f"    \"{palabra}\".")
                