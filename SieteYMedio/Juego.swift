//
//  Juego.swift
//  SieteYMedio
//
//  Created by Máster Móviles on 29/10/2019.
//  Copyright © 2019 Máster Móviles. All rights reserved.
//

import Foundation

class Juego {
    var baraja : Baraja
    var sumaJugador : Float
    var sumaMaquina : Float
    var seguirJugando : Bool
    
    init() {
        baraja = Baraja()
        sumaJugador = 0
        seguirJugando = true
        sumaMaquina = 0
    }
    
    func pedirCarta() -> Carta{
        let c : Carta = baraja.repartirCarta()
        sumarCarta(c)
        return c
    }
    
    func sumarCarta(_ carta: Carta){
        if(carta.valor >= 10){
            self.sumaJugador += 0.5
        }else{
            self.sumaJugador += Float(carta.valor)
        }
        
        comprobarSuma()
    }
    
    
    func comprobarSuma(){
        if(sumaJugador > 7.5){
            self.seguirJugando = false
        }
    }
    
    func resultadoMaquina() -> Float{
        let parteEntera = Int.random(in: 1..<7)
        let parteDecimal : [Float] = [0.0,0.5]
        self.sumaMaquina = Float(parteEntera)+parteDecimal.randomElement()!
        return self.sumaMaquina
    }
    
}
