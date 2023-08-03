//
//  ContentView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 28/07/2023.
//

import SwiftUI

struct ContentView: View {
    var menu:[MenuItem]
    
    @StateObject var orders: OrderModel = OrderModel()
    @State private var showOrders: Bool = false
    @State private var selectedItem: MenuItem = noMenuItem
    @State private var presentGrid:Bool = false
    
    
    var body: some View {
        TabView{
            VStack  {
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                StatusBarView(showOrders: $showOrders, presentGrid: $presentGrid)

                MenuItemView( item: $selectedItem, orders: orders)
                    .padding(5)
                    .background(.thinMaterial)
                if presentGrid {
                    MenuGridView(menu: menu, selectedItem: $selectedItem)
                }
                else {
                    MenuView(menu: menu, selectedItem: $selectedItem)
                }
                MenuView2(menu: menu)
            }
            .tabItem {
                Label("Menu", systemImage: "list.bullet")
            }
            VStack {
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                StatusBarView(showOrders: $showOrders, presentGrid: $presentGrid)

    //            if showOrders {
                    OrderView(orders: orders)
                        .cornerRadius(5)
                }
            .tabItem {
                Label("Order", systemImage: "cart")
            }
        }
        .padding(8)
        .background(.linearGradient(colors: [.cyan, Color("Ocean"), Color("Sky")], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orders)
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(menu: MenuModel().menu)
           
    }
}


