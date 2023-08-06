//
//  PageView.swift
//  BookApp
//
//  Created by Lê Ngọc Trâm on 06/08/2023.
//

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
