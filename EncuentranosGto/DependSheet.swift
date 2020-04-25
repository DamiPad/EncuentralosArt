//
//  DependSheet.swift
//  EncuentranosGto
//
//  Created by Laura Yaremith Damian  Padilla on 24/04/20.
//  Copyright © 2020 Laura Yaremith Damian  Padilla. All rights reserved.
//

import SwiftUI

struct Result: Codable{
    var artists: [Artistas]
}

struct Artistas: Codable, Identifiable {
       public var id: Int
       public var title: String
       public var authors: String
       public var description: String
       public var page: String
}



struct DependSheet: View {
     @State private var results=[Artistas]()
    
    var body: some View {
        NavigationView{
            List(results){item in
                //ForEach(results, id: \.id){item in
                    Section{
                        
                        VStack(alignment: .leading){
                                Text(item.title)
                                    .font(.headline)
                                Text(item.authors)
                                  
                                Text(item.description)
                                  
                                Text(item.page)
                                
                            }
                        }
                  //}
                    Section{
                        NavigationLink(destination: DependUbication()){
                            Text("visitame")
                        }
                    }
                
                }.onAppear(perform: loadData)
                .navigationBarTitle("Lista de Artistas")
                .listStyle(GroupedListStyle())
                
                
                
            }
            
            
        }
    
    
    func loadData(){
    
         let url = URL(string:"https://api.fake.rest/c56a5395-12e8-4034-a53f-30f11598e1dd/get")!
              URLSession.shared.dataTask(with: url) {(data, response, error) in
             do {
                 if let datos = data {
                     // 3.
                     let decodedData = try JSONDecoder().decode([Artistas].self, from: datos)
                      //print(decodedData)
                     DispatchQueue.main.async {
                         self.results = decodedData
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
    
    
    
    
   
    
    
    
    




struct DependSheet_Previews: PreviewProvider {
    static var previews: some View {
        DependSheet()
    }
}
