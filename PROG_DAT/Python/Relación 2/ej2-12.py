# -*- coding: utf-8 -*-
"""
12 - Escribe una función, suma_primer_digito(numeros), que devuelva la suma
de los primeros dígitos de todos los números de la lista que se le pasa como
argumento

@author: David Criado Ramón.
"""
from generar_lista import generar_lista

def suma_primer_digito(numeros):
    """
    Devuelve la suma de los primeros digitos de todos los números presentes
    en la lista "numeros".
    """
    primer_numero = lambda x: int(str(x)[0])
    
    # La suma también se podría hacer en un bucle for como en todos
    # los ejercicios anteriores.
    return sum(map(primer_numero, numeros))

if __name__ == '__main__':
    lista1 = generar_lista(10)
    lista2 = generar_lista(10)
    lista = [x * y for x, y in zip(lista1, lista2)]
    print(lista)
    print(suma_primer_digito(lista))
