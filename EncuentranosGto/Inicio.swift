//
//  Inicio.swift
//  EncuentranosGto
//
//  Created by Laura Yaremith Damian  Padilla on 25/04/20.
//  Copyright © 2020 Laura Yaremith Damian  Padilla. All rights reserved.
//

import SwiftUI

struct Inicio: View {
     @Environment(\.managedObjectContext) var managedObjectContext
     @FetchRequest(entity: Usuarios.entity(), sortDescriptors:[])

    
    var usuarios: FetchedResults<Usuarios>
    
    
 
    
    @State private var showDependSheet = false
    //var image: Image()
    
    var body: some View {
        NavigationView{
            
            VStack{
    
                Image("Acuarela")
                .resizable()
                .frame(width: 300, height: 300)
                .clipped()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .padding()
                .offset(y: -170)
                .padding(.bottom, -130)
            
                
                VStack(alignment: .leading) {
                    List{
                        ForEach(usuarios){ nuevo in
                            Text("Hola \(nuevo.self)")
                            
                        }
                    }
                }
                Button(action:{
                    self.showDependSheet = true
                }){
                    Text("Adelante...")
                    
                }.foregroundColor(.white)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(8)
                    .shadow(radius: 5)
                
            }.navigationBarTitle("Bienvenido", displayMode: .inline)
            
        }.sheet(isPresented: $showDependSheet){
          DependSheet().environment(\.managedObjectContext,self.managedObjectContext)
        }
        
        
       
    }
}
 
struct Inicio_Previews: PreviewProvider {
    static var previews: some View {
        Inicio()
    }
}
