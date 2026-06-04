//
//  LoginViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    
    @Published var destination: AuthRoute?
    @Published var email = ""
    @Published var password = ""
    
    @Published var showPatreonSheet = false
    
    func forgotPasswordTapped() {
        destination = .forgotPassword
    }
    
    func signupTapped() {
        destination = .signup(.login)
    }
    
    func login() {
          print("Email: \(email)")
          print("Password: \(password)")
      }
    
    func gotoHome(){
        if isValidEmail(email) && (validatePassword(password: password, confirmPassword: password) != nil){
            
        }
    }
    
    
}
