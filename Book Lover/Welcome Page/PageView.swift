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

struct PageView: View {
    var page: Page
        var body: some View {
                GeometryReader { geometry in
                    VStack( spacing: 16) {
                        Image("\(page.imageUrl)")
                            .resizable()
                            .scaledToFill()
                            .background(.gray.opacity(0.4))
                            .frame(height: geometry.size.height * 0.5)
                            .padding(.top, geometry.size.height * 0.05)

                        Text(page.name)
                            .font(.system(size: 26, weight: .semibold))
                            .foregroundColor(Color("DarkGold"))
                            .padding(.top, geometry.size.height * 0.05)


                        Text(page.description)
                            .font(.system(size: 16))
                            .frame(width: geometry.size.width * 0.95)
                            .foregroundColor(Color("DarkGold"))
                            .padding(.top, geometry.size.height * 0.01)

                        Spacer()
                    }
                    .frame(width: geometry.size.width * 1)
                    .frame(height: geometry.size.height * 0.9)
                    .fontDesign(.serif)

                }
            }
        
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: Page.samplePage)
    }
}
