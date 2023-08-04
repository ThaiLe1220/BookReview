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
    
    @State private var showOrders: Bool = false
    @State private var selectedBookItem: BookItem = noBookItem
    @State private var presentGrid:Bool = false
    
    
    var body: some View {
        TabView{
            VStack  {
                if (selectedBookItem.id != -1) {
                    StatusBarView()
                    BookItemView(selectedBookItem: $selectedBookItem, orders: orders, wishlists: wishlists)
                        .animation(.easeInOut(duration: 0.5), value: wishlists.wishlistItems)
                }
                else{
//                    Spacer()
//                        .frame(height: 266)
//                        .padding(0)

                }
                BookListView(book: book, selectedItem: $selectedBookItem)
                    .padding([.leading, .trailing], -12)
            }

            .background(.thinMaterial)
            .tabItem {
                Label("Book", systemImage: "book")
                
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
                BookWhislistView(wishlists: wishlists, books: BookModel().book, selectedItem: $selectedBookItem)
//                ContentView2(wishlists: wishlists)

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



