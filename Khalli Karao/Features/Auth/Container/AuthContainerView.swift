//
//  AuthContainerView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

import SwiftUI


struct AuthContainerView: View {

    let initialRoute: AuthRoute

    @StateObject private var router: AuthRouter

    init(initialRoute: AuthRoute) {
        self.initialRoute = initialRoute

        _router = StateObject(
            wrappedValue: AuthRouter(
                rootRoute: initialRoute
            )
        )
    }

    var body: some View {

        NavigationStack(path: $router.path) {

            rootView()
                .navigationDestination(for: AuthRoute.self) { route in

                    switch route {

                    case .login:
                        LoginView()

                    case .signup(let source):
                        SignupView(
                            viewModel: SignupViewModel(
                                source: source
                            )
                        )

                    case .forgotPassword:
                        ForgotPasswordView()

                    case .otp(let source):
                        OTPView(
                            viewModel:OtpViewModel(source :source)
                        )

                    case .resetPassword(let source):
                        ResetPasswordView(viewModel: ResetPasswordViewModel(source: source))
                    case .restPasswordSuccess:
                        ResetPasswordSuccessView()
                    case .connectToPatreon:
                        ConnectToPatreonView()
                    }
                }
        }
        .environmentObject(router)
    }

    @ViewBuilder
    private func rootView() -> some View {

        switch router.rootRoute {

        case .login:
            LoginView()

        case .signup(let source):
            SignupView(
                viewModel: SignupViewModel(
                    source: source
                )
            )

        case .forgotPassword:
            ForgotPasswordView()

        case .otp(let source):
            OTPView(viewModel: OtpViewModel(
                source: source
            ))

        case .resetPassword(let source):
            ResetPasswordView(viewModel: ResetPasswordViewModel(source: source))
            
        case .restPasswordSuccess:
            ResetPasswordSuccessView()
        case .connectToPatreon:
            ConnectToPatreonView()
        }
    }
}
