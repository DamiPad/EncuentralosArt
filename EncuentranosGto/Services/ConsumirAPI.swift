//
//  ConsumirAPI.swift
//  EncuentranosGto
//
//  Created by Laura Yaremith Damian  Padilla on 24/04/20.
//  Copyright © 2020 Laura Yaremith Damian  Padilla. All rights reserved.
//

import Foundation

struct Response: Codable{
    var results: [Artistas]
    
}

class ConsumirAPI {
    func getArtistas(completion: @escaping ([Artistas]) -> ()) {
        guard let url = URL(string: "https://api.fake.rest/c56a5395-12e8-4034-a53f-30f11598e1dd/get") else{
            fatalError("URL no valida")
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else{
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let artistas = try? JSONDecoder().decode([Artistas].self, from: data)
            DispatchQueue.main.async {
                completion(artistas)
            }
            
        }.resume()
    }
    
    func loadData(){
           guard let url = URL (string:"https://api.fake.rest/c56a5395-12e8-4034-a53f-30f11598e1dd/get") else{
             print("Invalid URL")
             return
           }
           let request = URLRequest(url: url)
           
           URLSession.shared.dataTask(with: request){data, response,  error in
               
               if let data = data{
                   if let artistas = try? JSONDecoder().decode(Response.self, from: data){
                       DispatchQueue.main.async {
                          self.results = decodeResponse.results
                       }
                       return
                       
                   }
               }
               print("Fetch Failed: \(error?.localizedDescription ?? "Unknow Error")")
               
           }.resume()
       }
}
