# -*- coding: utf-8 -*-
"""
10 - Escribe una función orden_alfabetico(palabra) que determinen si las letras
que forman palabra aprecen en orden alfabético. Por ejemplo, 'abejo'

@author: David Criado Ramón.
"""
def orden_alfabetico(palabra):
    """
    Indica si las letras que conforman palabra se encuentran en orden
    alfabético
    """
    palabra_test = palabra.lower()
    return palabra_test == ''.join(sorted(palabra_test))

if __name__ == '__main__':
    print(orden_alfabetico("abejo"))
    print(orden_alfabetico("hola"))
    print(orden_alfabetico("abeto"))
    print(orden_alfabetico("ajo"))
    print(orden_alfabetico(""))
