//
//  ContentView3.swift
//  Book Lover
//
//  Created by Lê Ngọc Trâm on 07/08/2023.
//

import SwiftUI

struct ContentView3: View {
    @State private var selectedTab = 0
    
    @State var orders: OrderModel = OrderModel()
    @State var isDarkMode: Bool = true
    @State var isShowingOrderRecap: Bool = true

    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1 Content")
                .tabItem {
                    Label("Tab 1", systemImage: "house")
                }
                .tag(0)

            Text("Tab 2 Content")
                .tabItem {
                    Label("Tab 2", systemImage: "heart")
                }
                .tag(1)

            Text("Tab 3 Content")
                .tabItem {
                    Label("Tab 3", systemImage: "person")
                }
                .tag(2)
        }
        .overlay(
            HStack {
      
                
                Button(action: {
                    withAnimation(.linear(duration: 1)) {
                        isShowingOrderRecap.toggle()
                        selectedTab = 1
                    }
                }) {
                    Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.fill")
                        .font(.system(size: 20))
                        .foregroundColor(Color("DarkGold"))
                    
                    isShowingOrderRecap ? Text(orders.orderTotal, format: .currency(code: "VND"))
                            .foregroundColor(Color("DarkGold")) : nil
                }

                Spacer()
                
                Button(action: {
                    isDarkMode.toggle()
                    
                }) {
                    Image(systemName: isDarkMode ? "moon" : "lightbulb")
                        .font(.system(size: 20))
                        .foregroundColor(Color("DarkGold"))
                }

            }
            .padding(.horizontal)
            .padding(.top, 10),
            alignment: .top
        )
    }
}


struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
