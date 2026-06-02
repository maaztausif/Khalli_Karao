//
//  ForgotPasswordView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

//

import SwiftUI
import Combine

struct ForgotPasswordView: View {

    
    @EnvironmentObject var authRouter: AuthRouter
    @StateObject private var viewModel = ForgetPasswordViewModel()
    

    var body: some View {
//        ScrollView {
            GeometryReader { geometry in
                
                let size = geometry.size.width * 0.25
                
                VStack {
                    
                    KhalliKaraoView(size: size)
                        .padding(.top,50)
                    Text("Forget Password!")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    Text("Enter the email address linked to your account. We'll send you a 6-digit verification code.")
                        .font(.system(size: 18, weight: .regular, design: .rounded))
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .padding(.horizontal, 30)
                        .lineLimit(nil)
                    TextLabelView(text: "Email Address")
                        .padding([.leading,.top],20)
                    
                    CustomTextField(
                        title: "Email",
                        text: $viewModel.email,
                        onFocus: {
                            print("Email focused")
                        }
                    )
                    
                    RectangleButton(title: "Set Resend Code ->", backgroundColor: Color.yellow, textColor: Color.black, borderColor: Color.clear) {
                        //viewmodel
                    }
                    .padding(.top)
                    
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .onReceive(viewModel.$destination.compactMap { $0 }) { route in
                
                print("Navigating to: \(route)")
                
                authRouter.push(route)
            }
//        }
    }
}

#Preview {
    ForgotPasswordView()
        .environmentObject(AuthRouter(rootRoute: AuthRoute.login))
}

