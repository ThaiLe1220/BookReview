//
//  SearchBar.swift
//  BookApp
//
//  Created by Lê Ngọc Trâm on 06/08/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $searchText)
                .foregroundColor(.primary)
            
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark")
                }
            }
        }
        
        .padding(8)
        .background(Color(.systemGray5))
        .cornerRadius(20)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant("213124"))
    }
}
