# -*- coding: utf-8 -*-
"""
11. Escribe una función, cadena_mas_larga(cadenas), a la que se le pase
una lista de palabras y que devuelva la palabra más larga.

@author: David Criado Ramón.
"""

def cadena_mas_larga(cadenas):
    """
    Devuelve la cadena más larga presente en la lista cadenas
    """
    
    # Se podría lanzar una excepción con Raise para esta comprobación
    if len(cadenas) == 0:
        print('Ha de pasarse al menos una cadena')
        return None
    
    
    longitud = len(cadenas[0])
    pos = 0
    for i in range(1, len(cadenas)):
        if len(cadenas[i]) > longitud:
            longitud = len(cadenas[i])
            pos = i
            
    return cadenas[pos]

if __name__ == '__main__':
    cadenas = ['Hola', 'David', 'programación', 'ejercicio', 'python']
    print(cadenas)
    print(f'La cadena más larga es {cadena_mas_larga(cadenas)}')
