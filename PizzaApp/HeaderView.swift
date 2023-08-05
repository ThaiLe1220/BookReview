//
//  HeaderView.swift
//  PizzaApp
//
//  Created by Lê Ngọc Trâm on 01/08/2023.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var orders: OrderModel
    @Environment(\.verticalSizeClass) var vSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        VStack {
            if (vSizeClass ?? .regular) != .compact {
                GeometryReader{ geometry in
                    ZStack (alignment: .topTrailing){
                        //                            Spacer()
                        Image("banner1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width * 1,height: 140)
                            .offset(y: -5)
                            .clipped()

    //                        .ignoresSafeArea()
                        //                            Spacer()
//                        Text("Thai Le Book Review")
//                            .font(.custom("Times", size: 30))
//    //                        .foregroundColor(Color.indigo)
//                            .foregroundStyle(.regularMaterial)
//                            .fontWeight(.semibold)
                    }
                }
            } else {
                GeometryReader{ geometry in
                    HStack (alignment: .bottom){
                        //                            Spacer()
                        Image("banner1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width * 0.6,height: 140)
                            .clipped()

    //                        .ignoresSafeArea()
//                        //                            Spacer()
//                        Text("Thai Le Book Review")
//                            .font(.custom("Times", size: 30))
//    //                        .foregroundColor(Color.indigo)
//                            .foregroundStyle(.pink)
//                            .fontWeight(.semibold)
                    }
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
