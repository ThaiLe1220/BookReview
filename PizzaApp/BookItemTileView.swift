//
//  MenuItemTileView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 02/08/2023.
//

import SwiftUI

struct BookItemTileView: View {
    var bookItem:BookItem
    
    var body: some View {

        
        VStack{
            Group{
                if let image =
                    UIImage(named: "duneBook\(bookItem.id)"){
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("bookError")
                        .resizable()
                        .scaledToFit()
                }
            }
            
            Text(bookItem.name).font(.system(size: 10))
                .padding(4)
        }
        .cornerRadius(3)
        .shadow(radius: 4, x: 4, y: 4)
    }
}

struct BookItemTileView_Previews: PreviewProvider {
    static var previews: some View {
        BookItemTileView(bookItem: testBookItem)
    }
}
