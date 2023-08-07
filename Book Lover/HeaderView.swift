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

struct HeaderView: View {
    @EnvironmentObject var orders: OrderModel
    
    var body: some View {
        VStack {
            GeometryReader{ geometry in
                ZStack (alignment: .topTrailing){
                    Image("banner1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width * 1,height: 140)
                        .offset(y: -5)
                        .clipped()
                }
            }
        }
        .frame(height: 140)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView().environmentObject(OrderModel())
    }
}
