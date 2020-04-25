//
//  Dependencias.swift
//  EncuentranosGto
//
//  Created by Laura Yaremith Damian  Padilla on 24/04/20.
//  Copyright © 2020 Laura Yaremith Damian  Padilla. All rights reserved.
//

import SwiftUI


struct DependSection: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [DependItem]
}

struct DependItem: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var nombre: String
    var latitud: Double
    var altitud: Double

   /* var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }*/

    #if DEBUG
    static let example = DependItem(id: UUID(), name: "IMUJ", nombre: "Instituto para las Mujeres Guanajuatenses", latitud: 21.0326544, altitud:-101.2535721)
    #endif
}


