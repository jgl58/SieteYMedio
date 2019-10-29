//
//  SieteYMedioTests.swift
//  SieteYMedioTests
//
//  Created by Máster Móviles on 29/10/2019.
//  Copyright © 2019 Máster Móviles. All rights reserved.
//

import XCTest
@testable import SieteYMedio

class SieteYMedioTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCartaCorrecta() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let carta : Carta = Carta(2,Palo.bastos)!
        
        XCTAssert(carta.valor == 2)
        XCTAssert(carta.palo == Palo.bastos)
        
    }
    
    func testCartaIncorrecta() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let carta : Carta? = Carta(-2,Palo.bastos)
        XCTAssert(carta == nil)
        
    }
    
    func testRespartirCarta() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let baraja : Baraja = Baraja()
        let tam = baraja.cartas.count
        let carta : Carta = baraja.repartirCarta()
        let presente = baraja.cartas.contains() {
                elemento in
                if elemento.valor == carta.valor && elemento.palo == carta.palo {
                    return true
                }
                else {
                    return false
                }
        }
    
        XCTAssert(baraja.cartas.count == tam-1)
        XCTAssertFalse(presente)
        
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
