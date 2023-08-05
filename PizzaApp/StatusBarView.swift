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
            Text(orders.orderItems.count < 2 ? " \(orders.orderItems.count) order" : "\(orders.orderItems.count) orders"  )
            Spacer()
                        
            Label {
                Text(orders.orderTotal, format: .currency(code: "VND"))
                    .foregroundColor(.orange)
            } icon:{
                Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.fill")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.orange)
            }
            

        }
        .frame(height: 30)
        .foregroundStyle(Color("DarkGold"))
        .font(.system(size: 16, weight: .semibold))
        .padding([.leading, .trailing], 8)
        
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView().environmentObject(OrderModel())
    }
}
