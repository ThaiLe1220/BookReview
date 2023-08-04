//
//  MenuGridView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 02/08/2023.
//

import SwiftUI

struct BookGridView: View {
    @State private var favorites:[Int] = []
    
    func book(id:Int) -> BookItem{
        book.first(where: {$0.id == id}) ?? noBookItem
    }
    
    var book:[BookItem]
    @Binding var selectedItem: BookItem
    let hGridLayout = Array(repeating: GridItem(.fixed(50) , spacing: 10), count: 1)
    let columnLayout = Array(repeating: GridItem(spacing: 20), count: 4)
    
    @Namespace private var nspace

    
    var body: some View {
        VStack{
            Text("Favourite Books")
                .fontWeight(.semibold)
                .foregroundColor(Color("DarkGold"))

            ScrollView (.horizontal){
                LazyHGrid(rows: hGridLayout) {
                    ForEach(favorites.sorted(), id:\.self) { itemId in
                        FavoriteBookTileView(bookItem: book(id: itemId))
                            .frame(height: 120)
                            
                            .matchedGeometryEffect(id: itemId, in: nspace)
                            .onTapGesture (count: 2) {
                                if let index = favorites.firstIndex(where: {$0 == itemId}){
                                    favorites.remove(at: index)
                                }
                            }
                            .onTapGesture {
                                selectedItem = book(id: itemId)
                            }
                    }
                }
            }
            .frame(height: 150)

            Text("Other Books")
                .fontWeight(.semibold)
                .foregroundColor(Color("DarkGold"))

            
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(book) { item in
                        if !favorites.contains(item.id){
                            
                            BookItemTileView(bookItem: item)
                                .animation(.easeOut(duration: 0.5), value: favorites)
                                .matchedGeometryEffect(id: item.id, in: nspace)
                                .frame(height: 120)
                                .onTapGesture (count: 2) {
                                    if !favorites.contains(item.id){
                                        withAnimation(.easeInOut){
                                            favorites.append(item.id)
                                        }
                                    }
                                }
                                .onTapGesture {
                                    
                                    selectedItem = item
                                }
                                .onLongPressGesture {
                                    selectedItem = noBookItem
                                    //                                }
                                }
                        }
                    }
                }
            }
        }
//        .animation(.easeOut(duration: 0.5), value: favorites)
        .background(.thinMaterial)

    }
}

struct BookGridView_Previews: PreviewProvider {
    static var previews: some View {
        BookGridView(book: BookModel().book, selectedItem: .constant(testBookItem))
    }
}
