//
//  ForgetPasswordViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

import Foundation
import Combine

final class ForgetPasswordViewModel:ObservableObject{
    
    @Published var destination: AuthRoute?
    @Published var email = ""
    func gotoOtpPage(){
        destination = .otp(.forgetPassword)
    }
}
