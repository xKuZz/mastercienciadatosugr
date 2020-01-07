# -*- coding: utf-8 -*-
"""
6. La traspuesta de una matriz se obtiene intercambiado filas y columnas.
Escribe una función que devuelva la traspuesta de una matriz.

@author: David Criado Ramón.
"""

import generar_lista

def traspuesta(matriz):
    """ 
    Devuelve la traspuesta de una matriz.
    Se asume que todas las listas internas tienen la misma dimensión, es decir,
    todas las filas de la matriz tienen el mismo número de columnas.
    """
    # Caso A: Matriz vacía
    if len(matriz) == 0:
        return []
    
    if len(matriz) == 1 and len(matriz[0]) == 0:
        return [[]]
    
    # En otro caso: hay al menos una fila con x columnas
    n_filas = len(matriz)
    n_columnas = len(matriz[0])
    
    salida = []
    
    for i in range(n_columnas):
        fila = []
        for j in range(n_filas):
            fila.append(matriz[j][i])
        salida.append(fila)
        
    return salida

if __name__ == '__main__':
    fila1 = generar_lista.generar_lista(4)
    fila2 = generar_lista.generar_lista(4)
    fila3 = generar_lista.generar_lista(4)
    matriz = [fila1, fila2, fila3]
    
    print(matriz)
    print(traspuesta(matriz))

