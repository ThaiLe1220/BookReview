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

struct SplashView: View {
    
    @State var isSplashFinished : Bool = false
    @State private var size = 0.6
    @State private var opacity = 0.5

    /// Customise SplashScreen
    var body: some View {
        
        VStack {
            if isSplashFinished {
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
                        .font(Font.custom("Baskerville-Bold", size: 40))

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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation {
                            self.isSplashFinished = true
                        }
                    }
                }
            }
        }
        .environment(\.colorScheme, .dark)

    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()

    }
}
