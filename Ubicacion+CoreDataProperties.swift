//
//  Ubicacion+CoreDataProperties.swift
//  EncuentranosGto
//
//  Created by Laura Yaremith Damian  Padilla on 25/04/20.
//  Copyright © 2020 Laura Yaremith Damian  Padilla. All rights reserved.
//
//

import Foundation
import CoreData


extension Ubicacion: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ubicacion> {
        return NSFetchRequest<Ubicacion>(entityName: "Ubicacion")
    }

    @NSManaged public var id: UUID
    @NSManaged public var latitud: Double
    @NSManaged public var longitud: Double

}
