/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Le Hong Thai
  ID: s3752577
  Created  date: 31/7/2023
  Last modified: 7/8/2023
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct ContentView: View {
    var book:[BookItem]
        
    @StateObject var orders: OrderModel = OrderModel()
    @StateObject var wishlists: WishlistModel = WishlistModel()
    
    @State private var selectedBookItem: BookItem = noBookItem
    @State private var isSelected = false
    @State private var isShowingOrderRecap: Bool = true
    @State private var selectedTab = 0


    @State private var isDarkMode = true

    var body: some View {
        GeometryReader { geometry in
            TabView (selection: $selectedTab){
                /// Browse View
                NavigationStack  {
                    BookListView(book: book, selectedItem: $selectedBookItem)
                        .padding([.leading, .trailing], -8)
                    
                    if (selectedBookItem.id != -1) {
                        VStack {
                            BookItemView(selectedBookItem: $selectedBookItem, orders: orders, wishlists: wishlists)
                                .animation(.easeInOut(duration: 0.6), value: selectedBookItem)
                        }
                    }
                }
                .tabItem {Label("Browse", systemImage: "square.grid.2x2.fill")}
                .padding(.top, geometry.size.height * 0.05)
                .tag(0)

                /// Order View
                VStack {
                    OrderView(orders: orders)
                    }
                .tabItem {Label("Order", systemImage: "cart")}
                .tag(1)

                /// Search View
                VStack {
                    SearchView(book: book, orders: orders, wishlists: wishlists)
                }
                .padding(.top, geometry.size.height * 0.03)

                .tabItem {Label("Search", systemImage: "magnifyingglass")}
                .tag(2)

                /// Wishlist View
                NavigationStack  {
                    HeaderView()
                        .shadow(radius: 4)
                    WhislistView(wishlists: wishlists, books: BookModel().book, selectedItem: $selectedBookItem)
                }
                .padding(.top, geometry.size.height * 0.04)

                .tabItem {Label("Favourite", systemImage: "heart.circle")}
                .tag(3)

            }
            .environmentObject(orders)
            .environment(\.colorScheme, isDarkMode ? .dark : .light)
            .overlay(
                /// overlay navbar
                HStack {
                    Spacer()

                    Button(action: {
                        withAnimation(.linear(duration: 1)) {
                            isShowingOrderRecap.toggle()
                            selectedTab = 1
                        }
                    }) {
                        Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.fill")
                            .font(.system(size: 22))
                            .foregroundColor(Color("DarkGold"))
                        
                        isShowingOrderRecap ? Text(orders.orderTotal, format: .currency(code: "VND"))
                                .foregroundColor(Color("DarkGold")) : nil
                    }
                    
                    Button(action: {
                        isDarkMode.toggle()
                    }) {
                        Image(systemName: isDarkMode ? "moon" : "lightbulb")
                            .font(.system(size: 22))
                            .foregroundColor(Color("DarkGold"))
                    }
                }
                .padding(.horizontal, 8)
                .padding(.top, 0),
                alignment: .top
        )}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(book: BookModel().book)
    }
}



