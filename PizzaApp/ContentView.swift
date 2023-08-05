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
    @State private var viewHeight: CGFloat = 266
    
    var body: some View {
        TabView{
            VStack  {
//                Text("412341")
                if (selectedBookItem.id != -1) {
                    
                    VStack {
                        StatusBarView()
                        BookItemView(selectedBookItem: $selectedBookItem, orders: orders, wishlists: wishlists)
                    }
                    .gesture(DragGesture()
                        .onChanged { value in
                            let maxHeight: CGFloat = 266
                            let minHeight: CGFloat = 0
                            let scrollOffset = value.translation.height
                            let newHeight = max(min(viewHeight - scrollOffset, maxHeight), minHeight)
                            viewHeight = newHeight
                        }
                    )
           
                }

                BookListView(book: book, selectedItem: $selectedBookItem)
                    .padding([.leading, .trailing], -12)
            }
    
            .tabItem {
                Label("Browse", systemImage: "square.grid.2x2.fill")
            }
            .background(.thinMaterial)
//            .border(.blue)
//            .padding(.bottom,0)

            
            VStack {
                StatusBarView()

    //            if showOrders {
                    OrderView(orders: orders)
                        .cornerRadius(5)
                }
            .tabItem {
                Label("Order", systemImage: "cart")
            }
            .background(.thinMaterial)

            VStack {
                
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



