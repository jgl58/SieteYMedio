//
//  Baraja.swift
//  SieteYMedio
//
//  Created by Máster Móviles on 29/10/2019.
//  Copyright © 2019 Máster Móviles. All rights reserved.
//

import Foundation


class Baraja {
    var cartas : [Carta]
    
    init() {
        self.cartas = [Carta]()
        cargarCartas()
        barajar()
    }
    
    func barajar() {
        self.cartas.shuffle()
    }
    
    func cargarCartas(){
        var palo : Palo = Palo.oros
        for p in 0...2 {
            
            if p == 0 {
                palo = Palo.oros
            } else if p == 1 {
                palo = Palo.copas
            } else if p == 2 {
                palo = Palo.espadas
            } else {
                palo = Palo.bastos
            }
            for n in 1...10{
                if n == 8 {
                    //es sota
                    self.cartas.append(Carta(10,palo)!)
                }
                else if n == 9 {
                    //es caballo
                    self.cartas.append(Carta(11,palo)!)
                    
                } else if n == 10 {
                    //es rey
                    self.cartas.append(Carta(12,palo)!)
                } else {
                    //es cualquier otra
                    self.cartas.append(Carta(n,palo)!)
                }
            }
        }
    }
    func repartirCarta() -> Carta {
        return cartas.popLast()!
    }
    
    
    
}
