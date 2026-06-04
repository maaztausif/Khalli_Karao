//
//  LoginView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

import SwiftUI
import Combine

struct LoginView: View {

    
    @EnvironmentObject var authRouter: AuthRouter
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        GeometryReader { geometry in
            
            let size = geometry.size.width * 0.25
            
        VStack {
            
            KhalliKaraoView(size: size)
                .padding(.top,50)
            Text("Welcome Back!")
                .font(.system(size: 30, weight: .bold, design: .rounded))
            Text("Sign in to your account")
                .font(.system(size: 18, weight: .none, design: .rounded))
                .foregroundStyle(Color.gray)
            TextLabelView(text: "Email Address")
                .padding([.leading,.top],20)
                
            CustomTextField(
                           title: "Email",
                           text: $viewModel.email,
                           onFocus: {
                               print("Email focused")
                           }, isSecureField: false
                       )
            TextLabelView(text: "Password")
                .padding(.leading, 20)
            CustomTextField(
                           title: "Password",
                           text: $viewModel.password,
                           onFocus: {
                               print("Email focused")
                           }, isSecureField: true
                       )
            HStack{
                Spacer()
                Button(action: {
                    viewModel.forgotPasswordTapped()
                }) {
                    Text("Forget Password?")
                        .foregroundColor(.yellow)
                        .bold(true)
                        .cornerRadius(10)
                }
                .padding(.trailing,10)
                
            }
            RectangleButton(title: "Sign In", backgroundColor: Color.yellow, textColor: Color.black, borderColor: Color.clear) {
                //viewmodel
            }
            HStack{
                Spacer()
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 50, height: 1)
                Text("or Continue with")
                    .foregroundColor(.gray)
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 50, height: 1)
                Spacer()
            }
            RectangleButton(title: "Continue with Patreon", backgroundColor: Color.red, textColor: Color.white, borderColor: Color.clear,image:"Icon_Patreon",isImage: true) {
                viewModel.showPatreonSheet = true
            }
            
            HStack{
                Spacer()
              
                Text("don't have an account?")
                    .foregroundColor(.gray)
                Button(action: {
                    viewModel.signupTapped()
                }) {
                    Text("Sign Up")
                        .foregroundColor(.yellow)
                        .bold(true)
                        .cornerRadius(10)
                }
                .padding(.trailing,10)
                Spacer()
            }
            Spacer()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
        .onReceive(viewModel.$destination.compactMap { $0 }) { route in

            print("Navigating to: \(route)")

            authRouter.push(route)
        }
        .sheet(isPresented: $viewModel.showPatreonSheet) {

            PatreonBottomSheet()
                .presentationDetents([.height(500)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthRouter(rootRoute: AuthRoute.login))
}
