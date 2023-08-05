//
//  MenuGridView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 02/08/2023.
//

import SwiftUI

struct BookWhislistView: View {
//    @State private var favorites:[Int] = []
    
    @ObservedObject var wishlists :WishlistModel

    func getBookById(id:Int) -> BookItem{
        books.first(where: {$0.id == id}) ?? noBookItem
    }
    
    var books:[BookItem]
    
    @Binding var selectedItem: BookItem
    let hGridLayout = Array(repeating: GridItem(.fixed(50) , spacing: 0), count: 1)
    let columnLayout = Array(repeating: GridItem(spacing: -10), count: 4)
    
    @Namespace private var nspace

    
    var body: some View {
        VStack{
            Text("Favourite Books")
                .fontWeight(.semibold)
                .foregroundColor(Color("DarkGold"))

            ScrollView (.horizontal){
                LazyHGrid(rows: hGridLayout) {
                    ForEach(wishlists.wishlistItems, id:\.self) { wishlistItem in
                        FavoriteBookTileView(bookItem: getBookById(id: wishlistItem.bookItem.id))
                            .frame(height: 120)
                            .matchedGeometryEffect(id: wishlistItem.id, in: nspace)
                            .onTapGesture (count: 2) {
                                wishlists.removeWishlist(id: wishlistItem.id)
                                }
                            .onTapGesture {
                                withAnimation(.easeOut(duration: 0.5)){
                                    selectedItem = getBookById(id: wishlistItem.bookItem.id)
                                }
                            }
                    }
                }
            }
            .frame(height: 120)

            Text("Other Books")
                .fontWeight(.semibold)
                .foregroundColor(Color("DarkGold"))

            
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(books) { item in
                        if !wishlists.checkforItemInWishList(item){
                            BookItemTileView(bookItem: item)
                                .animation(.easeOut(duration: 0.5), value: wishlists.wishlistItems)
                                .matchedGeometryEffect(id: item.id, in: nspace)
                                .onTapGesture (count: 2) {
                                    if !wishlists.checkforItemInWishList(item){
                                        withAnimation(.easeInOut){
                                            wishlists.addWishlist(item)
                                        }
                                    }
                                }
                                .onTapGesture {
                                    selectedItem = item
                                }
           
                        }
                    }
                }
            }
        }
        .background(.thinMaterial)
        .fontDesign(.serif)


    }
}

struct BookWhislistView_Previews: PreviewProvider {
    static var previews: some View {
        BookWhislistView(wishlists: WishlistModel(), books: BookModel().book, selectedItem: .constant(testBookItem))
    }
}
