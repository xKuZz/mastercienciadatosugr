# -*- coding: utf-8 -*-
"""
7 - Escribe una función comunes(palabra1, palabra2) que devuelva una cadena
formada por los caracteres comunes a las dos palabras.

@author: David Criado Ramón.
"""

def comunes(palabra1, palabra2):
    """
    Devuelve una cadena con todas las letras presentes en ambas palabras
    """
    letras1 = set(palabra1)
    letras2 = set(palabra2)
    return ''.join(letras1.intersection(letras2))

if __name__ == '__main__':
    p1, p2 = "hola", "caracol"
    print(f"{p1} | {p2} -> {comunes(p1, p2)}")
    p1, p2 = "gato", "felino"
    print(f"{p1} | {p2} -> {comunes(p1, p2)}")
    p1, p2 = "", "perro"
    print(f"{p1} | {p2} -> {comunes(p1, p2)}")