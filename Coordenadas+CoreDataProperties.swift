//
//  Coordenadas+CoreDataProperties.swift
//  EncuentranosGto
//
//  Created by Laura Yaremith Damian  Padilla on 25/04/20.
//  Copyright © 2020 Laura Yaremith Damian  Padilla. All rights reserved.
//
//

import Foundation
import CoreData


extension Coordenadas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coordenadas> {
        return NSFetchRequest<Coordenadas>(entityName: "Coordenadas")
    }

    @NSManaged public var altitud: Double
    @NSManaged public var dependencia: String?
    @NSManaged public var id: UUID?
    @NSManaged public var latitud: Double

}
