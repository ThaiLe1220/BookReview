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
                Text("\(order.bookItem.name)")
                    .font(.system(size: 15))
                    .foregroundColor(Color("DarkGold"))
                Spacer()
            }
            
            HStack(alignment:.firstTextBaseline){
                HStack (spacing: 0) {
                    Text ("Quantity: ")
                    Text (order.quantity, format: .number)
                }
                .font(.system(size: 13))
                .italic()
                Spacer()
                Text(order.extPrice, format: .currency(code: "VND"))
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.orange)
            }
            .padding(.top, -8)
        }
        .padding([.trailing, .leading], 8)
        .frame(height: 50)
        .fontDesign(.serif)

    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(order: .constant(testOrderItem))
    }
}
