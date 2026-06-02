//
//  OtpViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

import SwiftUI
import Combine

final class OtpViewModel:ObservableObject{
    
    let source:otpSource
    init(otpSource:otpSource){
        self.source = otpSource
    }
    
    func navigate(){
        switch source {
        case .forgetPassword:
            print("forget")
        case .signUp:
            print("signup")
        }
    }
}
