//
//  WelcomeView.swift
//  BookApp
//
//  Created by Lê Ngọc Trâm on 06/08/2023.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive : Bool = false
    @State private var size = 0.6
    @State private var opacity = 0.5

    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            WelcomeView()
        } else {
            VStack {
                VStack {
                    Image(systemName: "books.vertical.fill")
                        .font(.system(size: 80))
                        .foregroundColor(Color("DarkGold"))
                    
                    HStack {
                        Text("Book Lover")
                    }
                    .font(Font.custom("Baskerville-Bold", size: 30))

                    .foregroundColor(Color("DarkGold"))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
            }
            
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }

        }

    }

}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
