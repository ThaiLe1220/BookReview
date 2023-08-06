////
////  DropdownCategoryView.swift
////  PizzaApp
////
////  Created by Lê Ngọc Trâm on 04/08/2023.
////
//
//import SwiftUI
//
//struct DropdownCategoryView: View {
//    @Binding var selectedCategory: Bool
//    @Binding var selectedCategoryId: Int
//    
//    let item: DropdownCategoryItem
//    
//    var body: some View {
//        Button (action: {
//            selectedCategory = false
//            selectedCategoryId = item.id
//            item.onSelect()
//            
//        }) {
//            ZStack {
//                Text(item.title)
//                    .font(.system(size: 12, weight: .regular, design: .default))
//                    .frame(width: 120, height: 30)
//                    .background(.thinMaterial)
//            }
//            .border(.black)
//            .padding(0)
//        }
//    }
//}
//
//struct DropdownCategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        DropdownCategoryView(selectedCategory: .constant(true), selectedCategoryId: .constant(1), item: .init(id: 1, title: "Science Fiction", onSelect: {}))
//    }
//}
//
//
//struct DropdownCategoryItem : Identifiable {
//    let id: Int
//    let title: String
//    let onSelect: () -> Void
//}
