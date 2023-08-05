//
//  MenuRowView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import SwiftUI

struct BookRowView: View {
    var item:BookItem
    
    var body: some View {
        GeometryReader{ geometry in
            HStack (alignment: .top){
                if let image = UIImage(named: "book\(item.id)"){
                    Image(uiImage: image).resizable().frame(width: 60, height: 90)

                } else {
                    Image("bookError").resizable().frame(width: 60, height: 90)
                }
                Spacer()

                VStack (alignment: .leading) {
                    HStack (alignment: .top) {
                        VStack {
                            Text(item.name).font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color("DarkGold"))
                                .padding(.top, -4)

                        }
                        Spacer()
                        VStack (){
                            Text(item.price, format: .currency(code: "VND"))
                        }
                        .frame(width: geometry.size.width * 0.25)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(.orange)
                    }
                    
                    HStack {
                        RatingsView(rating: item.rating)
                        Text("\(item.rating)").bold()
                        Text(item.author)
                    }
                    .font(.system(size: 12))
                    .padding(.top, -8)
                    .padding(.leading, 4)
                    
                    Text("\(item.headline)")
                        .font(.system(size: 12, weight: .medium))
                        .padding(.top, -4)
                    
                }
            }
            .frame(width: geometry.size.width * 1,height: 90)
        }
        .frame(height: 90)
    }
}

struct BookRowView_Previews: PreviewProvider {
    static var previews: some View {
        BookRowView(item: testBookItem)
    }
}
