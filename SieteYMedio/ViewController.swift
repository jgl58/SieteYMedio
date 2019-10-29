//
//  ViewController.swift
//  SieteYMedio
//
//  Created by Máster Móviles on 29/10/2019.
//  Copyright © 2019 Máster Móviles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var juego : Juego!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func iniciarJuego(_ sender: Any) {
        juego = Juego()
        print("Nueva partida")

        let cartaPedida = juego.pedirCarta()
        
        let alert = UIAlertController(
            title: "Has elegido la carta",
            message: cartaPedida.descripcion() + " Tu suma es de \(juego.sumaJugador)",
            preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default)
        print(cartaPedida.descripcion() + " Tu suma es de \(juego.sumaJugador)")
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func plantarse(_ sender: Any) {
        var titulo : String = "Has ganado"
        let res = juego.resultadoMaquina()
        if juego.sumaMaquina >= juego.sumaJugador {
            titulo = "Has perdido"
        }
        let alert = UIAlertController(
            title: titulo,
            message:" Tu suma es de \(juego.sumaJugador) y la de la maquina \(res)",
            preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default)
        print("\(titulo) Tu suma es de \(juego.sumaJugador) y la de la maquina \(res)")
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func pedirCarta(_ sender: Any) {
        let cartaPedida = juego.pedirCarta()
        if !juego.seguirJugando{
            print("Te has pasado. \(cartaPedida.descripcion()) Tu suma es de \(juego.sumaJugador)")
        }else{
            let alert = UIAlertController(
                title: "Has elegido la carta",
                message: cartaPedida.descripcion() + " Tu suma es de \(juego.sumaJugador)",
                preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(
                title: "OK",
                style: UIAlertAction.Style.default)
            print(cartaPedida.descripcion() + " Tu suma es de \(juego.sumaJugador)")
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

