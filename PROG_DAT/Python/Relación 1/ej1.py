# -*- coding: utf-8 -*-
"""
1 - Escribe una función contar_letras(palabra, letra) que devuelva el número de
veces que aparece una palabra en una letra.

@author: David Criado Ramón.
"""

def contar_letras(palabra, letra):
    """
    Devuelve el número de veces que parece la letra "letra" en la
    palabra "palabra".
    """
    # Podemos usar el método count del string
    # Otra opción menos eficiente sería hacer un bucle
    # con contador.
    return palabra.count(letra)

def contar_letras_v2(palabra, letra):
    """
    Devuelve el número de veces que parece la letra "letra" en la
    palabra "palabra". Versión menos eficiente con bucle for y contador.
    """
    contador = 0
    for i in range(len(palabra)):
        if palabra[i] == letra:
            contador +=1
            
    return contador
    
    

if __name__ == '__main__':
    
    print("VERSIÓN COUNT")
    palabra = "palabra"
    letra = 'a'
    n = contar_letras(palabra, letra)
    print(f'La palabra {palabra} contiene {n} veces la letra {letra}.')
    palabra = ""
    n = contar_letras(palabra, letra)
    print(f'La palabra \"\" (vacía) contiene {n} veces la letra {letra}.')
    palabra = "abracadabra"
    letra = 'b'
    n = contar_letras(palabra, letra)
    print(f'La palabra {palabra} contiene {n} veces la letra {letra}.')
    letra = 'a'
    n = contar_letras(palabra, letra)
    print(f'La palabra {palabra} contiene {n} veces la letra {letra}.')
    
    print("VERSIÓN BUCLE Y CONTADOR")
    palabra = "palabra"
    letra = 'a'
    n = contar_letras_v2(palabra, letra)
    print(f'La palabra {palabra} contiene {n} veces la letra {letra}.')
    palabra = ""
    n = contar_letras_v2(palabra, letra)
    print(f'La palabra \"\" (vacía) contiene {n} veces la letra {letra}.')
    palabra = "abracadabra"
    letra = 'b'
    n = contar_letras_v2(palabra, letra)
    print(f'La palabra {palabra} contiene {n} veces la letra {letra}.')
    letra = 'a'
    n = contar_letras_v2(palabra, letra)
    print(f'La palabra {palabra} contiene {n} veces la letra {letra}.')

    

