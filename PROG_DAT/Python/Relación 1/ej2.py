# -*- coding: utf-8 -*-
"""
2 - Escribe una función eliminar_letras(palabra, letra) que devuelva una 
versión de palabra que no contiene el carácter letra.

@author: David Criado Ramón.
"""

def eliminar_letras(palabra, letra):
    """
    Devuelve una versión de "palabra" que no contiene la letra "letra".
    """
        
    return palabra.replace(letra, '')

def eliminar_letras_v2(palabra, letra):
    """
    Devuelve una versión de "palabra" que no contiene la letra "letra".
    Versión con lista y remove (menos eficiente)
    """
    apariciones = palabra.count(letra)
    palabra_lista = list(palabra)
    for aparicion in range(apariciones):
        palabra_lista.remove(letra)
        
    return ''.join(palabra_lista)
        
    
if __name__ == '__main__':
    print("VERSIÖN CON REPLACE")
    palabra = "palabra"
    letra = 'a'
    salida = eliminar_letras(palabra, letra)
    print(f"Si quitamos a la palabra \"{palabra}\" la letra \"{letra}\" nos queda" +
          f" la palabra \"{salida}\"")
    palabra = "comecocos"
    letra = 'c'
    salida = eliminar_letras(palabra, letra)
    print(f"Si quitamos a la palabra \"{palabra}\" la letra \"{letra}\" nos queda" +
          f" la palabra \"{salida}\"")
    palabra = ""
    letra = 'c'
    salida = eliminar_letras(palabra, letra)
    print(f"Si quitamos a la palabra \"{palabra}\" la letra \"{letra}\" nos queda" +
          f" la palabra \"{salida}\"")
    
    print("VERSIÖN CON LISTA Y REMOVE")
    palabra = "palabra"
    letra = 'a'
    salida = eliminar_letras_v2(palabra, letra)
    print(f"Si quitamos a la palabra \"{palabra}\" la letra \"{letra}\" nos queda" +
          f" la palabra \"{salida}\"")
    palabra = "comecocos"
    letra = 'c'
    salida = eliminar_letras_v2(palabra, letra)
    print(f"Si quitamos a la palabra \"{palabra}\" la letra \"{letra}\" nos queda" +
          f" la palabra \"{salida}\"")
    palabra = ""
    letra = 'c'
    salida = eliminar_letras_v2(palabra, letra)
    print(f"Si quitamos a la palabra \"{palabra}\" la letra \"{letra}\" nos queda" +
          f" la palabra \"{salida}\"")
    
    
    