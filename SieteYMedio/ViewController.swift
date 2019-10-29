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
    var vistasCartas = [UIImageView]()
    var contador : Int = 1
    
    @IBOutlet weak var btnPedir: UIButton!
    @IBOutlet weak var btnPlantarse: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func iniciarJuego(_ sender: Any) {
        juego = Juego()
        limpiarCartas()
        print("Nueva partida")
        btnPedir.isEnabled = true
        btnPlantarse.isEnabled = true
        let cartaPedida = juego.pedirCarta()
        dibujarCarta(carta: cartaPedida, enPosicion: contador)
        contador+=1
        print(cartaPedida.descripcion() + " Tu suma es de \(juego.sumaJugador)")
        
    }
    
    @IBAction func plantarse(_ sender: Any) {
        var titulo : String = "Has ganado"
        let res = juego.jugarMaquina()
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
        btnPedir.isEnabled = false
        btnPlantarse.isEnabled = false
    }
    
    @IBAction func pedirCarta(_ sender: Any) {
        let cartaPedida = juego.pedirCarta()
        dibujarCarta(carta: cartaPedida, enPosicion: contador)
        
        if !juego.seguirJugando{
            let alert = UIAlertController(
                title: "Te has pasado",
                message: "Tu suma es de \(juego.sumaJugador)",
                preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(
                title: "OK",
                style: UIAlertAction.Style.default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
            btnPedir.isEnabled = false
            btnPlantarse.isEnabled = false
            //limpiarCartas()
            print("Te has pasado. \(cartaPedida.descripcion()) Tu suma es de \(juego.sumaJugador)")
        }else{
            print(cartaPedida.descripcion() + " Tu suma es de \(juego.sumaJugador)")
        }
        contador+=1
    }
    
    func dibujarCarta(carta: Carta, enPosicion : Int) {
        let limitesPantalla = UIScreen.main.bounds
        let anchoPantalla = limitesPantalla.width
        let altoPantalla = limitesPantalla.height

        let nombreImagen = String(carta.valor)+String(carta.palo.rawValue)
        //creamos un objeto imagen
        let imagenCarta = UIImage(named: nombreImagen)
        //para que la imagen sea un componente más del UI,
        //la encapsulamos en un UIImageView
        let cartaView = UIImageView(image: imagenCarta)
        //Inicialmente la colocamos fuera de la pantalla y más grande
        //para que parezca más cercana
        //"frame" son los límites de la vista, definen pos y tamaño
        cartaView.frame = CGRect(x: -200, y: -200, width: 200, height: 300)
        //La rotamos, para que al "repartirla" haga un efecto de giro
        cartaView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi));
        //La añadimos a la vista principal, si no no sería visible
        self.view.addSubview(cartaView)
        //guardamos la vista en el array, para luego poder eliminarla
        self.vistasCartas.append(cartaView)
        //Animación de repartir carta
        UIView.animate(withDuration: 0.5){
            //"efecto caida": la llevamos a la posición final
            cartaView.frame = CGRect(x:50+70*(enPosicion-1), y:100, width:Int(anchoPantalla/4), height:Int(altoPantalla/5));
            //0 como ángulo "destino", para que rote mientras "cae"
            cartaView.transform = CGAffineTransform(rotationAngle:0);
        }
    }
    
    func limpiarCartas(){
        self.contador = 1
        //Quitamos las cartas de la pantalla
        for vistaCarta in self.vistasCartas {
            vistaCarta.removeFromSuperview()
        }
        //ya no tenemos imágenes de cartas en pantalla, ponemos el array a vacío
        self.vistasCartas=[]
    }
}

