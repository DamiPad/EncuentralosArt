
//
//  ContentView.swift
//  EncuentranosGto
//
//  Created by Laura Yaremith Damian  Padilla on 22/04/20.
//  Copyright © 2020 Laura Yaremith Damian  Padilla. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var showDependSheet = false
    
    @State private var usuario: String = ""
    @State private var password: String = ""
    
        
    var body: some View {
       NavigationView{
         VStack{
                HStack (alignment: .center){
                    Image("icono")
                       
                }.padding()
            
                HStack(alignment: .center) {
                    Text("Usuario:")
                        .font(.callout)
                        .bold()
                    TextField("Ingresa el usuario...", text: $usuario)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
            
                HStack(alignment: .center) {
                    Text("Password:")
                     .font(.callout)
                     .bold()
                    
                    TextField("Ilngresa el Password...", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }.padding()
            
                HStack(alignment: .center) {
                    
                    Button(action:{
                        //guard self.tableNumber != "" else {return}
                                        //guardar en la base de datos insert del objeto order
                        let newUsuario = Usuarios(context: self.managedObjectContext)
                        newUsuario.id = UUID()
                        newUsuario.nombre = self.usuario
                        newUsuario.password = self.password
                         do{
                             try self.managedObjectContext.save()
                                    
                            }
                        catch{
                            print(error.localizedDescription)
                            }
                        
                          self.showDependSheet = true
                        
                      }){
                          Text("Entrar")
                          
                      }.foregroundColor(.white)
                          .padding()
                          .background(Color.blue)
                          .cornerRadius(8)
                          .shadow(radius: 5)
                      
                }.padding()
            
            }.navigationBarTitle("EncuentranosArtC")

            
            }.sheet(isPresented: $showDependSheet){
              Inicio().environment(\.managedObjectContext,self.managedObjectContext)
            }
        
    }
       
        
        
}
        
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
