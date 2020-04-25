//
//  ItemView.swift
//  EncuentranosGto
//
//  Created by Laura Yaremith Damian  Padilla on 24/04/20.
//  Copyright © 2020 Laura Yaremith Damian  Padilla. All rights reserved.
//

import SwiftUI

struct ItemView: View {
    var item:DependItem
    var body: some View {
    NavigationLink(destination:DependUbication()){
            
        HStack{
            
                
                VStack(alignment:.leading){
                        Text(item.name)
                            .font(.headline)
                        Text(item.nombre)
     
                    }
            Spacer()
            
        }
                
    }
  }
    
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: DependItem.example)
    }
}
