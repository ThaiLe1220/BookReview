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
                    UIImage(named: "book\(bookItem.id)"){
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("bookError")
                        .resizable()
                        .scaledToFit()
                }
            }
            .shadow(color: Color("DarkGold"), radius:2, x:2, y:2)
            
            Text(bookItem.name)
                .font(.system(size: 8))
                .padding([.leading, .trailing], 6)
                .frame(width: 90, height: 24)
                .fontWidth(.init(-0.15))
        }
        .cornerRadius(3)
        .frame(width: 90, height: 180)
        .fontDesign(.serif)

    }
    
}

struct BookItemTileView_Previews: PreviewProvider {
    static var previews: some View {
        BookItemTileView(bookItem: testBookItem)
    }
}
