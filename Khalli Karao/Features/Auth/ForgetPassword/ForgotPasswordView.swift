//
//  ForgotPasswordView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

import SwiftUI

struct ForgotPasswordView: View {

    @EnvironmentObject var authRouter: AuthRouter

    var body: some View {

        VStack(spacing: 20) {

            Text("Forgot Password")

            Button("Send OTP") {
                authRouter.push(.otp)
            }
        }
        .navigationTitle("Forgot Password")
    }
}
