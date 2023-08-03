//
//  OrderRowView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import SwiftUI

struct OrderRowView: View {
    @Binding var order:OrderItem
    
    var body: some View {
        VStack () {
            HStack {
                Text("Your Order item \(order.item.name)")
                Spacer()
            }
            
            HStack(alignment:.firstTextBaseline){
                Text (order.quantity, format: .number)
                Text(order.item.price, format: .currency(code: "VND"))

                Spacer()
                Text(order.extPrice, format: .currency(code: "VND"))
                    .fontWeight(.semibold)
            }
        }
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(order: .constant(testOrderItem))
    }
}
