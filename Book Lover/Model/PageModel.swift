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

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample description for the purpose of debugging", imageUrl: "work", tag: 0)
    
    static var welcomePages: [Page] = [
        Page(name: "Welcome to Book Lover", description: "We are here to explore new ideas and knowledge", imageUrl: "welcome1", tag: 0),
        Page(name: "Want to know more?", description: "The perfect place to relax and have fun", imageUrl: "welcome2", tag: 1),
        Page(name: "Meet our developer :D", description: "This is Le Hong Thai, some call him Eugene\nLet's get along", imageUrl: "welcome3", tag: 2),
    ]
}
