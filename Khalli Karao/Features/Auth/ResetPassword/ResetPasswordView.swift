//
//  ResetPasswordView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @EnvironmentObject var authRouter: AuthRouter
    @ObservedObject var viewModel = ResetPasswordViewModel()
    
    var body: some View {
        
        VStack {
            CircularView()
            Text("Password Reset!")
            Text("Your password has been updated successfully. You can now sign in with your new password.")
                .padding(10)
                .padding([.trailing,.leading],15)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            
            RectangleButton(title: "Goto Sign In ->", backgroundColor: .yellow, textColor: .black, borderColor: .clear) {
                authRouter.replaceRoot(with: .login)
            }
        }
    }
}

#Preview {
    ResetPasswordView()
}
