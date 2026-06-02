//
//  AuthContainerView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

import SwiftUI

struct AuthContainerView: View {

    @StateObject private var router = AuthRouter()

    var body: some View {

        NavigationStack(path: $router.path) {

            LoginView()
                .navigationDestination(for: AuthRoute.self) { route in

                    switch route {

                    case .login:
                        LoginView()

                    case .signup:
                        SignupView()

                    case .forgotPassword:
                        ForgotPasswordView()

                    case .otp:
                        OTPView()

                    case .resetPassword:
                        ResetPasswordView()
                    }
                }
        }
        .environmentObject(router)
    }
}
