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

struct RatingsView: View {
    var rating: Int
    
    var body: some View {
        HStack{
            ForEach(1...5, id:\.self) { circle in
                //star.leadinghalf.filled
                Image(systemName: (circle <= rating) ? "star.fill" : "star")
        
            }
            .foregroundColor(.yellow)
            .padding(-5)
        }
    }
}

struct RatingsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsView(rating: 4)
    }
}
