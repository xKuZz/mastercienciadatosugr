# -*- coding: utf-8 -*-
"""
12 - Un anagrama de una palabra pal1 es una palabra formada con las mismas
letras que pal1 pero en orden distinto. Escribe una función 
anagrama(palabra1, palabra2) que determine si es un anagrama.
Ejemplo: marta -> trama
@author: David Criado Ramón.
"""

def anagrama(palabra1, palabra2):
    """
    Indica si palabra2 es un anagrama de palabra1, es decir, tienes las mismas
    letras pero en ordne distinto.
    """
    return ''.join(sorted(palabra1)) == ''.join(sorted(palabra2))

if __name__ == '__main__':
    print(anagrama("marta", "trama"))
    print(anagrama("marta", "tramo"))
    print(anagrama("", ""))
    print(anagrama("casa", "saca"))