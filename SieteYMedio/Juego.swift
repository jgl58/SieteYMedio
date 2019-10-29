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
    var seguirJugandoMaquina : Bool
    
    init() {
        baraja = Baraja()
        sumaJugador = 0
        seguirJugando = true
        seguirJugandoMaquina = true
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
    
    func sumarCartaMaquina(_ carta: Carta){
        if(carta.valor >= 10){
            self.sumaMaquina += 0.5
        }else{
            self.sumaMaquina += Float(carta.valor)
        }
        
        comprobarSumaMaquina()
        
    }
    
    func comprobarSuma(){
        if(sumaJugador > 7.5){
            self.seguirJugando = false
        }
    }
    func comprobarSumaMaquina(){
        if(sumaMaquina > 7.5){
            print("La maquina se ha pasado")
            self.seguirJugandoMaquina = false
        }
    }
    
    func jugarMaquina() -> Float{
        var decision = true
        print("Cartas de la maquina")
        while decision || seguirJugandoMaquina{
            let c = baraja.repartirCarta()
            print(c.descripcion())
            sumarCartaMaquina(c)
            if seguirJugandoMaquina == false {
                break
            }
            if sumaMaquina == 7.5 {
                print("La maquina tiene 7.5")
                seguirJugandoMaquina == false
                break
            }
            let decisionSeguir : [Bool] = [false,true,true,true,true]
            decision = decisionSeguir.randomElement()!
            if !decision {
                seguirJugandoMaquina = false
                print("La maquina se ha plantado")
            }
        }
        return sumaMaquina
        
}
