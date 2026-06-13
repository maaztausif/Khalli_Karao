//
//  ResetPasswordViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 03.06.26.
//

import SwiftUI
import Combine

final class ResetPasswordViewModel:ObservableObject{
    
    @Published var destination:AuthRoute?
    @Published var appRoute:AppRoute?
    
    @Published var password:String = ""
    @Published var confirmPassword:String = ""
    @Published var isVerified = false

    
    var source:changePasswordSource
    
    init(source:changePasswordSource){
        self.source = source
    }
    
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
    
    
    func resetPasswrd(){
        if let error = validatePassword(password: self.password, confirmPassword: self.confirmPassword) {
            print(error)
        } else {
            print("Valid")
        }
    }
    
    func setPasswordTap(){
        switch source {
        case .forgetPassword:
            print("forget password")
            destination = .restPasswordSuccess
        case .updatePassword:
            isVerified = true
            print("update password")
            
        }
    }
}
