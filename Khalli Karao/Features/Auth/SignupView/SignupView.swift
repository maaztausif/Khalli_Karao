//
//  SignupView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

//
//  LoginView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

import SwiftUI
import Combine

struct SignupView: View {
    
    
    @EnvironmentObject var authRouter: AuthRouter
    @StateObject private var viewModel: SignupViewModel

    init(viewModel: SignupViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                
                let size = geometry.size.width * 0.25
                
                VStack {
                    
                    KhalliKaraoView(size: size)
                        .padding(.top,100)
                    Text("Welcome Back!")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    Text("Sign in to your account")
                        .font(.system(size: 18, weight: .none, design: .rounded))
                        .foregroundStyle(Color.gray)
                    TextLabelView(text: "Full Name")
                        .padding([.leading,.top],20)
                    
                    CustomTextField(
                        title: "Full Name",
                        text: $viewModel.fullName,
                        onFocus: {
                        }, isSecureField: false
                    )
                    TextLabelView(text: "Email Address")
                        .padding([.leading,.top],20)
                    
                    CustomTextField(
                        title: "Email",
                        text: $viewModel.email,
                        onFocus: {
                        }, isSecureField: false
                    )
                    TextLabelView(text: "Password")
                        .padding(.leading, 20)
                    CustomTextField(
                        title: "Password",
                        text: $viewModel.password,
                        onFocus: {
                        }, isSecureField: true
                    )
                    TextLabelView(text: "Confirm Password")
                        .padding(.leading, 20)
                    CustomTextField(
                        title: "Confirm Password",
                        text: $viewModel.confirmPassword,
                        onFocus: {
                        }, isSecureField: true
                    )
                    
                    VStack(alignment: .leading) {

                        PasswordRequirementView(
                            text: "At least 8 characters",
                            isValid: viewModel.hasMinLength
                        )

                        PasswordRequirementView(
                            text: "No special characters",
                            isValid: !viewModel.hasNoSpecialCharacters
                        )

                        PasswordRequirementView(
                            text: "Passwords match",
                            isValid: viewModel.passwordsMatch
                        )
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    RectangleButton(title: "Create Account", backgroundColor: Color.yellow, textColor: Color.black, borderColor: Color.clear) {
                        viewModel.createAcount()
                    }
                    
                    HStack{
                        Spacer()
                        
                        Text("Already have an account?")
                            .foregroundColor(.gray)
                        Button(action: {
                            
                            viewModel.gotoSignIn()
                        }) {
                            Text("Sign In")
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
            .onReceive(viewModel.$shouldGoBack) { shouldGoBack in

                if shouldGoBack {
                    authRouter.replaceRoot(with: .login)
                }
            }
            .onReceive(viewModel.$destination.compactMap { $0 }) { route in
                
                print("Navigating to: \(route)")
                
                if route == .otp(.signUp){
                    authRouter.push(route)
                }else{
                    authRouter.replaceRoot(with: .login)

                }
            }
        }
        .ignoresSafeArea(edges: .top)

    }
}

#Preview {
    SignupView(viewModel: SignupViewModel.init(source: .login))
        .environmentObject(AuthRouter(rootRoute: AuthRoute.login))
}
