//
//  Coordenadas.swift
//  EncuentranosGto
//
//  Created by Laura Yaremith Damian  Padilla on 24/04/20.
//  Copyright © 2020 Laura Yaremith Damian  Padilla. All rights reserved.
//

import SwiftUI

class Coordenada: ObservableObject{
    @Published var items = [DependItem]()
    
    var latitud: Double!
    var altitud: Double!


    func coord(item: DependItem) {
        latitud = item.latitud
        altitud = item.altitud
        
        
    }
}

