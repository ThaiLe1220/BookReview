//
//  OrderView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var orders :OrderModel

    
    var body: some View {
        VStack {
            
            NavigationStack {
                List($orders.orderItems){ $order in
                    
                    NavigationLink(value: order){
                        OrderRowView(order: $order)
                            .padding(4)
                            .background(.regularMaterial, in:RoundedRectangle(cornerRadius: 4))
                            .shadow(radius: 5)
                            .padding(.bottom, 5)
                            .padding([.leading,.trailing], 8)
                    }.navigationDestination(for: OrderItem.self) { order in
                        OrderDetailView(orderItem: $order, presentSheet: .constant(false), newOrder: .constant(false))
                    }.navigationTitle("Your Order")
                    
                }
            }
            .padding(.top, 80)
            
            Button("Delete Order") {
                if !orders.orderItems.isEmpty{orders.removeLast()}
            }
            .padding(5)
            .background(.regularMaterial, in:Capsule())
            .padding(10)
        }
        .background(Color("Ocean").opacity(0.2))
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orders: OrderModel())
    }
}
