# -*- coding: utf-8 -*-
"""
4 - Escribe una función num_vocales(palabra) que devuelva el número de vocales
que aparece en una palabra.

@author: David Criado Ramón.
"""

def num_vocales(palabra):
    """
    Devuelve el número de vocales que tiene la palabra "palabra".
    """
    salida = 0
    for vocal in "aeiouáéíóú":
        salida += palabra.count(vocal)
        
    return salida
        
    
if __name__ == '__main__':
    palabra = "caracol"
    print(f"La palabra \"{palabra}\" tiene {num_vocales(palabra)} vocales.")
    palabra = "tortuga"
    print(f"La palabra \"{palabra}\" tiene {num_vocales(palabra)} vocales.")
    palabra = "conejo"
    print(f"La palabra \"{palabra}\" tiene {num_vocales(palabra)} vocales.")
    palabra = ""
    print(f"La palabra \"{palabra}\" tiene {num_vocales(palabra)} vocales.")