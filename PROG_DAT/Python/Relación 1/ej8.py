# -*- coding: utf-8 -*-
"""
8 - Escribe una función eco_palabra(palabra) que devuelva una cadena formada
por palabra repetida tantas veces como sea su longitud.

@author: David Criado Ramón.
"""

def eco_palabra(palabra):
    """
    Devuelve la palabra en una cadena repetida tantas veces como larga 
    sea la palabra en caracteres
    """
    return palabra * len(palabra)

if __name__ == '__main__':
    palabra = "hola"
    print(f"{palabra} -> {eco_palabra(palabra)}")
    palabra = ""
    print(f"{palabra} -> {eco_palabra(palabra)}")
    palabra = "conejo"
    print(f"{palabra} -> {eco_palabra(palabra)}")

