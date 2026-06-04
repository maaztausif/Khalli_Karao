//
//  SignupViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

import Foundation
import Combine

final class SignupViewModel: ObservableObject {
    
    let source: SignupSource

    init(source: SignupSource) {
        self.source = source
    }
    
    @Published var destination: AuthRoute?
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var shouldGoBack = false
    
    
    var hasMinLength: Bool {
        password.count >= 8
    }

    var hasNoSpecialCharacters: Bool {
        password.range(
            of: "[^A-Za-z0-9]",
            options: .regularExpression
        ) == nil
    }

    var passwordsMatch: Bool {
        !confirmPassword.isEmpty &&
        password == confirmPassword
    }
    
    
    func createAcount() {
        if let error = validatePassword(password: self.password, confirmPassword: self.confirmPassword) {
            print(error)
        } else {
            destination = .otp(.signUp)

            print("Valid")
        }
    }
    
    func gotoSignIn() {
        if source == .login{
            destination = .login
        }else{
            shouldGoBack = true
        }
    }
    
    func login() {
          print("Email: \(email)")
          print("Password: \(password)")
      }

}
