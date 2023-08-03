//
//  MenuGridView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 02/08/2023.
//

import SwiftUI

struct MenuGridView: View {
    @State private var favorites:[Int] = [-1]
    
    func menu(id:Int) -> MenuItem{
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }
    
    var menu:[MenuItem]
    @Binding var selectedItem: MenuItem
    let columnLayout = Array(repeating: GridItem(spacing: 20), count: 3)
    let columnLayout2 = Array(repeating: GridItem(spacing: 20), count: 5)
    
    @Namespace private var nspace

    
    var body: some View {
        VStack{
            LazyVGrid(columns: columnLayout2) {
                ForEach(favorites.sorted(), id:\.self) { itemId in
                    FavoriteTileView(menuItem: menu(id: itemId))
                        .matchedGeometryEffect(id: itemId, in: nspace)
                        .onTapGesture {
                            selectedItem = menu(id: itemId)
                        }
                        .onLongPressGesture {
                            if let index = favorites.firstIndex(where: {$0 == itemId}){
                                favorites.remove(at: index)
                            }
                        }
                }
            }
            
            Text(selectedItem.name)
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(menu) { item in
                        if !favorites.contains(item.id){
                            
                            MenuItemTileView(menuItem: item)
                                .animation(.easeOut(duration: 0.5), value: favorites)
                                .matchedGeometryEffect(id: item.id, in: nspace)

                                .frame(height: 200)
                                .onTapGesture (count: 2) {
                                    if !favorites.contains(item.id){
                                        withAnimation(.easeInOut){
                                            favorites.append(item.id)
                                        }
                                    }
                                }
                            //                              .onTapGesture (count: 2) {
                            //                                    selectedItem = item
                            //                              }
                            
                                .onTapGesture {
                                    
                                    selectedItem = item
                                }
                                .onLongPressGesture {
                                    selectedItem = noMenuItem
                                    //                                }
                                }
                        }
                    }
                }
            }
        }
//        .animation(.easeOut(duration: 0.5), value: favorites)

    }
}

struct MenuGridView_Previews: PreviewProvider {
    static var previews: some View {
        MenuGridView(menu: MenuModel().menu, selectedItem: .constant(testMenuItem))
    }
}
