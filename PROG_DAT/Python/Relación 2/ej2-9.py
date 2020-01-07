# -*- coding: utf-8 -*-
"""
9. Escriba una función, suma_acumulada(numeros), a la que se le pase una lista
de números y devuelva una lista en la que el i-ésimo elemento se obtiene como
la suma de los elementos de la lista entre las posiciones 0 e i. Por ejemplo,
para [1, 2, 3] sería [1, 3, 6]

@author: David Criado Ramón.
"""
from generar_lista import generar_lista

def suma_acumulada(numeros):
    """
    Devuelve la suma acumulada de los elementos presentes en numeros.
    """
    salida = []
    suma = 0
    for numero in numeros:
        suma += numero
        salida.append(suma)
    return salida

if __name__ == '__main__':
    numeros = generar_lista(10)
    print(numeros)
    print(suma_acumulada(numeros))

