//
//  ResetPasswordView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 03.06.26.
//

import SwiftUI
import Combine

struct ResetPasswordView:View{
    
    @StateObject var viewModel:ResetPasswordViewModel
    
    @EnvironmentObject var authRouter:AuthRouter
    var onComplete: (() -> Void)?

    init(viewModel: ResetPasswordViewModel, onNavigate: ((AuthRoute) -> Void)? = nil, onComplete: (() -> Void)? = nil) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onComplete = onComplete
    }
    
    var body: some View{
        GeometryReader { geometry in
            VStack{
                KhalliKaraoView(size: geometry.size.width*0.3)
                    .padding(.top,50)
                Text("Reset Password!")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                Text("Choose a strong new password.")
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    .padding(.horizontal, 30)
                    .lineLimit(nil)
                
                TextLabelView(text: "New Password")
                    .padding([.leading,.trailing],20)
                    .padding(.top,30)
                CustomTextField(title: "New Password", text: $viewModel.password,isSecureField: true)
                    .padding([.leading,.trailing])

                TextLabelView(text: "Confirm Password")
                    .padding([.leading,.trailing],20)

                CustomTextField(title: "Confirm Password", text: $viewModel.confirmPassword,isSecureField: true)
                    .padding([.leading,.trailing])

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
                
                RectangleButton(title: "Done", backgroundColor: .yellow, textColor: .black, borderColor: .clear) {
                    viewModel.setPasswordTap()
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onReceive(viewModel.$destination.compactMap{$0}) { route in
            authRouter.push(route)
        }
        .onReceive(viewModel.$isVerified.filter { $0 }) { _ in
             onComplete?()
         }
    }
}

#Preview {
    ResetPasswordView(viewModel: ResetPasswordViewModel.init(source: .forgetPassword))
}
