//
//  MenuItemTileView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 02/08/2023.
//

import SwiftUI

struct MenuItemTileView: View {
    var menuItem:MenuItem
    
    var body: some View {

        
        VStack{
            Group{
                if let image =
                    UIImage(named: "duneBook\(menuItem.id)"){
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("bookError")
                        .resizable()
                        .scaledToFit()
                }
            }
            
            Text(menuItem.name).font(.caption2)
                .padding(4)
        }
        .background(Color("Sky").opacity(0.5))
        .background(.regularMaterial)
        .cornerRadius(10)
        .shadow(radius: 4, x: 4, y: 4)
    }
}

struct MenuItemTileView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemTileView(menuItem: testMenuItem)
    }
}
