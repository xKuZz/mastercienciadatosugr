# -*- coding: utf-8 -*-
"""
9 - Escribe una función palíndromo(frase) que determine si es un palíndromo. Es
decir, que se lea igual de izquierda a derecha que de derecha a izquierda.
(sin considerar espacios).

@author: David Criado Ramón.
"""

def palindromo(frase):
    """
    Determina si una frase es un palíndromo (se lee igual de izquierda
    a derecha que de derecha a izquierda)
    """
    frase_test = frase.lower().replace(' ', '')
    
    return frase_test == frase_test[::-1]

if __name__ == '__main__':
    print(palindromo("Atar a la rata"))
    print(palindromo("Yo hago yoga hoy"))
    print(palindromo("Yo no hago yoga hoy"))
    print(palindromo(""))