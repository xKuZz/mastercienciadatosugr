# -*- coding: utf-8 -*-
"""
6 - Escribe una función es_inversa(palabra1, palabra2) que devuelve True
si palabra es la misma que la otra pero con los caracteres en orden inverso.
Por ejemplo, 'absd' y 'dsba'
@author: David Criado Ramón.
"""

def es_inversa(palabra1, palabra2):
    """
    La función indica si palabra2 es la palabra inversa a palabra1 devolviendo
    True. Si no lo fuese devuelve False.
    """
    return palabra1 == palabra2[::-1]
    

if __name__ == '__main__':
    print(es_inversa("absd", "dsba"))
    print(es_inversa("", ""))
    print(es_inversa("hola", "adiós"))
    print(es_inversa("hola", "aloh"))