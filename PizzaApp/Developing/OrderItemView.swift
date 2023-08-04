//
//  OrderItemView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 02/08/2023.
//

import SwiftUI

struct OrderItemView: View {
    @Binding var orderItem:OrderItem
    @State private var quantity = 1
    @State private var doubleIngredient = false
    @State var bookCrust: BookFormat
    @State private var name:String = ""
    @State private var comments:String = ""
    init (orderItem:Binding<OrderItem>) {
        self._orderItem = orderItem
        self.bookCrust = orderItem.item.format.wrappedValue
    }
    
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Toggle(isOn: $doubleIngredient){
                Text("Double Ingredients " + (doubleIngredient ? "Yes" : "No"))
            }
            
            Stepper(value: $quantity, in:1...10) {
                Text("\(quantity) " + (quantity == 1 ? "pizza" : "pizzas"))
            }
            Picker(selection: $bookCrust) {
                ForEach(BookFormat.allCases, id:\.self){crust in
                    Text(crust.rawValue).tag(crust)
                }
            } label: {
                Text("Pizza Crust")
            }
//                .pickerStyle(WheelPickerStyle())
//                .pickerStyle(SegmentedPickerStyle())
            .pickerStyle(MenuPickerStyle())
            
            VStack {
                Text("comments").font(.caption)
                    .foregroundColor(.secondary)
                TextEditor(text: $comments)
            }
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .shadow(radius: 3)
            
            Spacer()
        }
        .padding(8)
    }
}

struct OrderItemView_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemView(orderItem: .constant(testOrderItem))
    }
}
