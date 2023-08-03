//
//  StatusBarView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 02/08/2023.
//

import SwiftUI

struct StatusBarView: View {
    @Binding var showOrders:Bool
    @Binding var presentGrid:Bool
    @EnvironmentObject var orders: OrderModel
    
    
    var body: some View {
        HStack {
            Text("\(orders.orderItems.count) orders ")
            Spacer()
            Button {
                showOrders.toggle()
            } label: {
                Image (systemName: showOrders ? "cart" : "menucard").font(.title)
            }
            
            if !showOrders {
                Button {
                    presentGrid.toggle()
                } label: {
                    Image (systemName: presentGrid ? "square.grid.3x2" : "list.bullet").font(.title)
                }
            .padding(.leading, 20)
            }
            
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
        StatusBarView(showOrders: .constant(false), presentGrid: .constant(true)).environmentObject(OrderModel())
    }
}
