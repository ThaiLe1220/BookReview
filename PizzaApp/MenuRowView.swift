//
//  MenuRowView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import SwiftUI

struct MenuRowView: View {
    var item:MenuItem
    
    var body: some View {
        GeometryReader{ geometry in
            HStack (alignment: .top, spacing: 5){
                if let image = UIImage(named: "duneBook\(item.id)"){
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 60, height: 90)
//                        .padding(.leading, -5)

                } else {
                    Image("bookError").resizable().frame(width: 60, height: 60)
                }
                VStack (alignment: .leading) {
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text(item.price, format: .currency(code: "VND"))
                    }
                    RatingsView(rating: item.rating)
                }
                Spacer()
            }
            .frame(width: geometry.size.width * 1,height: 90)
            .border(Color.indigo)
        }
        .frame(height: 90)
    }
}

struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(item: testMenuItem)
    }
}
