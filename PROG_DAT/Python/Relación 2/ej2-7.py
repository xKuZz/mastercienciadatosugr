# -*- coding: utf-8 -*-
"""
7. Escribe una función, contar_letras(palabra), que tome una palabra como
argumento y devuelva una lista de pares en la que aparece cada letra junto
con el número de veces que aparece esa letra en la palabra. Por ejemplo,
contar_letras('patata'), devuelve [('a',3), ('p', 1), ('t', 2)].

@author: David Criado Ramón.
"""

def contar_letras(palabra):
    """
    Devuelve una lista con las duplas que indican la frecuencia con la que
    aparece cada caracter en una palabra.
    """
    letras = sorted(list(set(palabra)))
    salida = []
    for letra in letras:
        salida.append((letra, palabra.count(letra)))
        
    return salida
    
    
if __name__ == '__main__':
    print('patata', contar_letras('patata'))
    print('david', contar_letras('david'))
    print('ejercicio', contar_letras('ejercicio'))
    
