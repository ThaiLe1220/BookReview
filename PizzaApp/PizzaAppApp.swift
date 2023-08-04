//
//  PizzaAppApp.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 28/07/2023.
//

import SwiftUI

@main
struct PizzaAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(book: BookModel().book)
        }
    }
}
