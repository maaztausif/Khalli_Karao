//
//  AuthRoute.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

import Foundation

enum AuthRoute: Hashable {
    case login
    case signup(SignupSource)
    case forgotPassword
    case otp(otpSource)
    case resetPassword(changePasswordSource)
    case restPasswordSuccess
    case connectToPatreon
}

enum SignupSource: Hashable {
    case welcome
    case login
}

enum otpSource: Hashable{
    case forgetPassword
    case signUp
    case changePassword
}

enum changePasswordSource:Hashable{
    case forgetPassword
    case updatePassword
}
