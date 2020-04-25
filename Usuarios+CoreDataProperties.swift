//
//  Usuarios+CoreDataProperties.swift
//  EncuentranosGto
//
//  Created by Laura Yaremith Damian  Padilla on 23/04/20.
//  Copyright © 2020 Laura Yaremith Damian  Padilla. All rights reserved.
//
//

import Foundation
import CoreData


extension Usuarios: Identifiable{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usuarios> {
        return NSFetchRequest<Usuarios>(entityName: "Usuarios")
    }

    @NSManaged public var id: UUID
    @NSManaged public var nombre: String
    @NSManaged public var password: String

}
