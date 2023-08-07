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

struct WhislistView: View {
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
        GeometryReader { geometry in
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
            .fontDesign(.serif)
            .frame(height: geometry.size.height * 0.999)
        }
    }
}

struct WhislistView_Previews: PreviewProvider {
    static var previews: some View {
        WhislistView(wishlists: WishlistModel(), books: BookModel().book, selectedItem: .constant(testBookItem))
    }
}
