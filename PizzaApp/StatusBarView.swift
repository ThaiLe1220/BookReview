//
//  StatusBarView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 02/08/2023.
//

import SwiftUI

struct StatusBarView: View {

    @EnvironmentObject var orders: OrderModel
    
    
    var body: some View {
        HStack {
            Text("\(orders.orderItems.count) orders ")
            Spacer()
            
            Spacer()
            
            Label {
                Text(orders.orderTotal, format: .currency(code: "VND"))
            } icon:{
                Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
            }

        }
        .foregroundStyle(.secondary)
        .font(.title2)    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView().environmentObject(OrderModel())
    }
}
