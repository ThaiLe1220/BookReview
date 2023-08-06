//
//  StatusBarView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 02/08/2023.
//

import SwiftUI

struct StatusBarView: View {
    
    @EnvironmentObject var orders: OrderModel
    @Binding var isDarkMode: Bool

    init(isDarkMode:Binding<Bool>){
        self._isDarkMode = isDarkMode
    }
    
    var body: some View {
        NavigationView {
            HStack {
                Label {
                    Text(orders.orderTotal, format: .currency(code: "VND"))
                        .foregroundColor(Color("OrangePeel"))
                } icon:{
                    Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.fill")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(Color("OrangePeel"))
                }
                Spacer()
                Image(systemName: isDarkMode ? "moon" : "lightbulb")
                    .font(.system(size: 24))
                    .foregroundColor(Color("OrangePeel"))
                    .onTapGesture {
                        isDarkMode.toggle()
                    }
            
            }
            .padding([.leading, .trailing], 8)

        }
        .frame(height: 30)
        .font(.system(size: 16, weight: .semibold))
        .environment(\.colorScheme, isDarkMode ? .dark : .light)
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView(isDarkMode: Binding<Bool>.constant(true)).environmentObject(OrderModel())
    }
}
