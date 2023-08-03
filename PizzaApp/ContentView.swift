//
//  ContentView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 28/07/2023.
//

import SwiftUI

struct ContentView: View {
    var book:[BookItem]
    
    @StateObject var orders: OrderModel = OrderModel()
    @State private var showOrders: Bool = false
    @State private var selectedItem: BookItem = noBookItem
    @State private var presentGrid:Bool = false
    
    
    var body: some View {
        TabView{

            
            VStack  {
//                HeaderView()
//                    .shadow(radius: 5)
//                    .environment(\.colorScheme, .light)
                StatusBarView()

                BookItemView( item: $selectedItem, orders: orders)
                    .background(.thinMaterial)

                BookView(book: book, selectedItem: $selectedItem)
            }
            .tabItem {
                Label("Book", systemImage: "list.bullet")
            }
            VStack {
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                StatusBarView()

    //            if showOrders {
                    OrderView(orders: orders)
                        .cornerRadius(5)
                }
            .tabItem {
                Label("Order", systemImage: "cart")
            }
            
            VStack  {
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                BookGridView(book: book, selectedItem: $selectedItem)

            }
            .tabItem {
                Label("Favourite", systemImage: "heart.circle")
            }
        }
        .environmentObject(orders)
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(book: BookModel().book)
           
    }
}



