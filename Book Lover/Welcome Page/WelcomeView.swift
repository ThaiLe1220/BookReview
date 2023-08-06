//
//  WelcomeView.swift
//  BookApp
//
//  Created by Lê Ngọc Trâm on 06/08/2023.
//

import SwiftUI

struct WelcomeView: View {
    @State private var pageIndex = 0
    @State var isWelcomeFinished : Bool = false

    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()

    var body: some View {
        NavigationView {
            if isWelcomeFinished {
                ContentView(book: BookModel().book)
            } else {
                TabView(selection: $pageIndex) {
                    ForEach(pages) { page in
                        VStack {
                            PageView(page: page)
                            if page == pages.last {
                                Button("next", action: {
                                    withAnimation(.easeIn(duration: 0.6)){
                                        isWelcomeFinished = true
                                        
                                    }
                                    })
                                    .font(.system(size: 24, weight: .semibold))
                                    .padding(.top, -100)
                                    .foregroundColor(Color("DarkGold"))
                            } else {
                                Button("next", action: incrementPage)
                                    .font(.system(size: 24, weight: .semibold))
                                    .padding(.top, -100)
                                    .foregroundColor(Color("DarkGold"))
                            }
                 
                        }
                        .tag(page.tag)
                    }
                }
                .animation(.linear(duration: 1), value: pageIndex) // 2
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                .tabViewStyle(PageTabViewStyle())
                .onAppear {
                    dotAppearance.currentPageIndicatorTintColor = .systemGray
                    dotAppearance.pageIndicatorTintColor = .systemGray6
                }
                .fontDesign(.serif)
            }
        }
        .environment(\.colorScheme, .dark)

    }

    func incrementPage() {
       pageIndex += 1
    }

    func goToZero() {
       pageIndex = 0
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
