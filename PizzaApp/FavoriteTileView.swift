//
//  FavoriteTileView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 03/08/2023.
//

import SwiftUI

struct FavoriteTileView: View {
    
    var menuItem: MenuItem
    
    var body: some View {
        VStack {
            Group{
                if let image = UIImage(named: "duneBook\(menuItem.id)"){
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("bookError")
                        .resizable()
                        .scaledToFit()
                }
            }
            .clipShape(Capsule())
            .shadow(radius: 3, x:2, y:2)
            Text(menuItem.name).font(.caption2)
                .padding(5)
                .background(.regularMaterial)

        }
    }
}

struct FavoriteTileView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteTileView(menuItem: testMenuItem)
    }
}
