//
//  FavoriteTileView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 03/08/2023.
//

import SwiftUI

struct FavoriteBookView: View {
    
    var bookItem: BookItem
    
    var body: some View {
        VStack {
            Group{
                if let image = UIImage(named: "duneBook\(bookItem.id)"){
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("bookError")
                        .resizable()
                        .scaledToFit()
                }
            }
            .shadow(radius: 3, x:2, y:2)
            Text(bookItem.name).font(.caption)
                .padding(5)

        }
    }
}

struct FavoriteBookView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteBookView(bookItem: testBookItem)
    }
}
