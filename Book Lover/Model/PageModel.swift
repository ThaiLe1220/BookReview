//
//  PageModel.swift
//  BookApp
//
//  Created by Lê Ngọc Trâm on 06/08/2023.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample description for the purpose of debugging", imageUrl: "work", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Welcome to Book Lover", description: "We are here to explore new ideas and knowledge", imageUrl: "welcome1", tag: 0),
        Page(name: "Want to know more?", description: "The perfect place to relax and have fun", imageUrl: "welcome2", tag: 1),
        Page(name: "Meet our developer :D", description: "This is Le Hong Thai, some call him Eugene\nLet's get along", imageUrl: "welcome3", tag: 2),
    ]
}
