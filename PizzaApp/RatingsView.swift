//
//  RatingsView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import SwiftUI

struct RatingsView: View {
    var rating: Int
    
    var body: some View {
        HStack{
            ForEach(1...5, id:\.self) { circle in
                Image(systemName: (circle <= rating) ? "star.circle.fill" : "circle")
            }
            .padding(-2)
        }
    }
}

struct RatingsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsView(rating: 5)
    }
}
