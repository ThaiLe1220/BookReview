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

struct FavoriteBookTileView: View {
    
    var bookItem: BookItem
    
    var body: some View {
        VStack {
            Group{
                if let image =
                    UIImage(named: "book\(bookItem.id)"){
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("bookError")
                        .resizable()
                        .scaledToFit()
                }
            }
            .shadow(color: Color("DarkGold"), radius:2, x:2, y:2)
            
            Text(bookItem.name)
                .font(.system(size: 8))
                .padding([.leading, .trailing], 6)
                .frame(maxHeight: 24)
                .fontWidth(.init(-0.15))
        }
        .frame(width: 70)
        .fontDesign(.serif)

    }
}

struct FavoriteBookTileView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteBookTileView(bookItem: testBookItem)
    }
}
