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
    
    func createAcount() {
        destination = .forgotPassword
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
