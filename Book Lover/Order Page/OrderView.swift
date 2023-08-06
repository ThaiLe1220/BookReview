//
//  OrderView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var orders: OrderModel
    
    @State private var isShowingOrderDetail = false
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                if orders.orderItems.isEmpty {
                    VStack {
                        Image(systemName: "bag")
                            .font(.system(size: 65))
                            .foregroundColor(Color("Black"))
                            .padding(.top, geometry.size.height * -0.13)
                        
                        Text("No order available")
                            .foregroundColor(Color("Black"))
                            .font(.system(size: 22, weight: .semibold))
                            .padding(.top, geometry.size.height * -0.03)

                    }
                    .navigationTitle(Text("Order"))
                } else {
                    
                    List($orders.orderItems){ $order in
                        NavigationLink(value: order){
                            OrderRowView(order: $order, orders: orders)
                                .padding(.leading, -12)
                        }
                        .navigationDestination(for: OrderItem.self) { order in
                            OrderItemView(orderItem: $order)
                        }
                        .buttonStyle(.plain)
                    }
                    .navigationTitle(Text("Order"))
                }
            }
            .frame(height: geometry.size.height * 0.999)

            .fontDesign(.serif)
        }

    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orders: OrderModel())
    }
}
