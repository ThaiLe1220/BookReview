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
    @StateObject var wishlists: WishlistModel = WishlistModel()
    
    @State private var selectedBookItem: BookItem = noBookItem
    @State private var isSelected = false
    
    var body: some View {
        TabView{
            VStack  {
                if (selectedBookItem.id != -1) {
                    VStack {
                        StatusBarView()
                        BookItemView(selectedBookItem: $selectedBookItem, orders: orders, wishlists: wishlists)
                    }
                }
                BookListView(book: book, selectedItem: $selectedBookItem)
                    .padding([.leading, .trailing], -8)
            }
            .tabItem {
                Label("Browse", systemImage: "square.grid.2x2.fill")
            }

            VStack {
                StatusBarView()
//                    .environment(\.colorScheme, .light)

                OrderView(orders: orders)
                }
            .tabItem {
                Label("Order", systemImage: "cart")
            }
            .background(.thinMaterial)

            VStack {
                ZStack {
                    Text("Hello Search")
                }
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            .background(.thinMaterial)
            
            VStack  {
                HeaderView()
                    .shadow(radius: 5)
                BookWhislistView(wishlists: wishlists, books: BookModel().book, selectedItem: $selectedBookItem)
//                ContentView2(wishlists: wishlists)

            }
            .tabItem {
                Label("Favourite", systemImage: "heart.circle")
            }
            .background(.thinMaterial)
//            .environment(\.colorScheme, .dark)


        }
        .environmentObject(orders)

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(book: BookModel().book)
           
    }
}



