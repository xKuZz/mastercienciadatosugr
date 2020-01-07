# -*- coding: utf-8 -*-
"""
14. Escribe una función que saque de forma aleatoria todas las cartas de una
baraja hasta que quede vacía.

@author: David Criado Ramón.
"""

import random

def sacar_carta(baraja):
    """
    Entiendo que esta función ha de sacar una única carta de la baraja.
    El bucle para sacar todas las cartas hasta que se quede vacía estará en
    el main.
    """
    pos = random.randint(0, len(baraja) - 1)
    return baraja.pop(pos)

if __name__ == '__main__':
    # Generamos baraja
    palos = ['copas', 'oros', 'bastos', 'espadas']
    cartas = [str(i) for i in range(1,10)]
    cartas.extend(['Sota', 'Caballo', 'Rey'])
    baraja = [f'{carta} de {palo}' for carta in cartas for palo in palos]
    
    # Sacamos elementos de la baraja
    while len(baraja) != 0:
        carta = sacar_carta(baraja)
        print(f'Hemos sacado: {carta}. Quedan {len(baraja)} cartas en baraja.')
        
