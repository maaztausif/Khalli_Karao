//
//  WelcomeView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

import SwiftUI
import Combine

struct WelcomeView: View {
    
    @EnvironmentObject var router: AppRouter
    @StateObject private var viewModel = WelcomeViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            
            let circleSize = geometry.size.width * 0.5
            let circleSizeInner = geometry.size.width * 0.4
            
            VStack  {
                ZStack {
                    Circle()
                        .fill(Color(hex: "#F5B800").opacity(0.3))
                        .frame(width: circleSize, height: circleSize)
                    
                    Circle()
                        .fill(Color(hex: "#F5B800"))
                        .frame(width: circleSizeInner, height: circleSizeInner)
                    
                    Text("Khalii\nKarao!")
                        .bold()
                        .font(.system(size: 18, weight: .heavy))

                }
                Text("Your Questiones,\nAnswered.")
                    .bold()
                    .font(.system(size: 25, weight: .heavy))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text("Ask anything. Get real advice.\nFrom someone who gets it.")
                    .bold()
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top,5)
                
    
                RectangleButton(
                    title: "Get Started ->",
                    backgroundColor: Color(hex: "#ECBB40"),
                    textColor: .black,
                    borderColor: .black
                ) {
                    viewModel.gotoLoginPage()
                }
                .padding(.top,30)
                
                RectangleButton(
                    title: "I already have an account",
                    backgroundColor: Color.clear,
                    textColor: .white,
                    borderColor: .gray
                ) {
                    viewModel.gotoSignupPage()
                }
                .padding(.top,30)
            }
            .frame(maxWidth: .infinity, maxHeight: geometry.size.height * 0.7)
            
        }
        .background(Color.black)
        .onReceive(viewModel.$destination.compactMap { $0 }) { route in
                router.navigate(to: route)
            }

        
    }
}

#Preview {
    WelcomeView()
}
