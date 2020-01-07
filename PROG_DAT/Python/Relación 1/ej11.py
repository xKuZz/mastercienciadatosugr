# -*- coding: utf-8 -*-
"""
11 - Escribe una función trocear(palabra, num) que devuelva una lista con
trozos de tamaño num de palabra.

@author: David Criado Ramón.
"""
def trocear(palabra, num):
    
    lista = [palabra[num*i:num*(i+1)] for i in range(len(palabra)//num +1)]
    if lista[-1] == '':
        del lista[-1]
    return lista

if __name__ == '__main__':
    print(trocear("hola", 2))
    print(trocear("caracol", 3))
    print(trocear("abracadabra", 3))
    print(trocear("", 2))
    

