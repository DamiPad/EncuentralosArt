//
//  Respuesta.swift
//  EncuentranosGto
//
//  Created by Laura Yaremith Damian  Padilla on 24/04/20.
//  Copyright © 2020 Laura Yaremith Damian  Padilla. All rights reserved.
//

import Foundation
import SwiftUI

/*struct Artistas: Codable, Identifiable {
       public var id: Int
       public var title: String
       public var authors: String
       public var description: String
       public var page: String
}



class datosArt: ObservableObject {
    
  @Published var artistasD = [Artistas]()
     
    init() {
        let url = URL(string: !
             URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let datos = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode([Artistas].self, from: datos)
                     //print(decodedData)
                    DispatchQueue.main.async {
                        self.artistasD = decodedData
                    }
                } else {
                    print("No se encontro datos")
                }
            } catch {
                print("Error fallo")
            }
        }.resume()
    }
}

*/
