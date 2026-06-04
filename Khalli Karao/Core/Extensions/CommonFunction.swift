//
//  CommonFunction.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 03.06.26.
//

import SwiftUI


func validatePassword(password:String,confirmPassword:String) -> String? {

    if password.count < 8 {
        return "Password must be at least 8 characters."
    }

    let hasSpecialCharacter = password.range(
        of: "[^A-Za-z0-9]",
        options: .regularExpression
    ) != nil

    if !hasSpecialCharacter {
        return "Password cannot contain special characters."
    }

    if password != confirmPassword {
        return "Passwords do not match."
    }

    return nil
}


func isValidEmail(_ email: String) -> Bool {

    let emailRegex =
    #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#

    return NSPredicate(
        format: "SELF MATCHES %@",
        emailRegex
    ).evaluate(with: email)
}
