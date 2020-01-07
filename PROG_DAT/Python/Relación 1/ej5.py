# -*- coding: utf-8 -*-
"""
5 - Escribe una función vocales(palabra), que devuelva las vocales
    que aparecen en la palabra.

@author: David Criado Ramón.
"""

def vocales(palabra):
    """
    Devuelve un conjunto las vocales únicas que aparecen en la palabra.
    """
    vocales_set = set(list("aeiouáéíóú"))
    palabra_set = set(list(palabra))
    
    return vocales_set.intersection(palabra_set)

if __name__ == '__main__':
    palabra = "caracol"
    print(f"En \"{palabra}\" aparecen las vocales {vocales(palabra)}.")
    palabra = "tortuga"
    print(f"En \"{palabra}\" aparecen las vocales {vocales(palabra)}.")
    palabra = "conejo"
    print(f"En \"{palabra}\" aparecen las vocales {vocales(palabra)}.")
    palabra = ""
    print(f"En \"{palabra}\" aparecen las vocales {vocales(palabra)}.")
    print("set() [un conjunto vacío] indica que no ha ninguna vocal.")

