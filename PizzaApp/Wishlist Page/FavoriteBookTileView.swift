//
//  FavoriteTileView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 03/08/2023.
//

import SwiftUI

struct FavoriteBookTileView: View {
    
    var bookItem: BookItem
    
    var body: some View {
        VStack {
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
                .font(.system(size: 9))
                .padding([.leading, .trailing], 6)
                .frame(maxHeight: 24)
                .fontWidth(.init(-0.15))
        }
        .frame(width: 70)
    }
}

struct FavoriteBookTileView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteBookTileView(bookItem: testBookItem)
    }
}
