//
//  OrderItemView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 02/08/2023.
//

import SwiftUI

struct OrderItemView: View {
    @Binding var orderItem:OrderItem

    @State private var quantity:Int
    @State private var name:String
    @State private var comments:String
    
    init (orderItem:Binding<OrderItem>) {
        self._orderItem = orderItem
        
        self.quantity = Int(orderItem.quantity.wrappedValue)
        self.name = orderItem.name.wrappedValue
        self.comments = orderItem.comments.wrappedValue
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: 8){
                VStack {
                    if let image = UIImage(named: "book\(orderItem.bookItem.id)"){
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(3)
                            .frame(height: 220)
                    } else {
                        Image("bookError")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(3)
                            .frame(height: 220)
                    }
                }
                
                HStack {
                    Text(orderItem.bookItem.name)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color("DarkGold"))
                        .lineLimit(2)
                    Spacer()
                }
                
                VStack (spacing: 6) {
                    HStack {
                        Text("Author: \(orderItem.bookItem.author)")
                        Spacer()
                    }
                    HStack {
                        Text("Category: \(orderItem.bookItem.category.rawValue)")
                        Spacer()
                    }
                    HStack {
                        Text("Format: \(orderItem.bookItem.format.rawValue)")
                        Spacer()
                    }
                }
                .italic()
                .font(.system(size: 14, weight: .light))
                
                HStack {
                    Text("\(quantity) " + (quantity == 1 ? "item" : "items"))
                    .italic()
                    
                    Spacer()
                    
                    Text(orderItem.bookItem.price * quantity, format: .currency(code: "VND"))
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.orange)
                }
                
                Text("Order Name").font(.subheadline).foregroundColor(.secondary)
                
                TextField("Create order name for this book (optional)", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: Color("SealBrown") , radius: 1)
                
                
                Text("Comment").font(.subheadline).foregroundColor(.secondary)
                
                TextEditor(text: $comments)
                    .frame(height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .shadow(color: Color("SealBrown") , radius: 1)
                
            }
            .padding(.leading, 8)
            .padding(.trailing, 8)
            .fontDesign(.serif)

        }
    }
}

struct OrderItemView_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemView(orderItem: .constant(testOrderItem))
    }
}
