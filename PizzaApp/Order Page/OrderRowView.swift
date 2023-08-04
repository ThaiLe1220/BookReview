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
                HStack (spacing: 0) {
                    Text ("Quantity: ")
                    Text (order.quantity, format: .number)
                }
                .italic()
                .font(.system(size: 16))
                Spacer()
                Text(order.extPrice, format: .currency(code: "VND"))
                    .fontWeight(.semibold)
                    .foregroundColor(.orange)
            }
            .padding(.top, -8)
        }
        .padding([.trailing, .leading], 8)
        .frame(height: 50)
        .border(.black)
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(order: .constant(testOrderItem))
    }
}
