//
//  OtpViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

import SwiftUI
import Combine

final class OtpViewModel:ObservableObject{
    
    @Published var destination:AuthRoute?
    @Published var destinationHome:AppRoute?
    
    @Published var isVerified = false
    let source:otpSource
    @Published var otp = ""
    
    @Published var remainingSec = 5
    @Published var canResend = false
    private var timer:Timer?
    
    var timerText:String{
        let minute = remainingSec / 60
        let second = remainingSec % 60
        
        return String(
            format: "%02d:%02d",
            minute,
            second
        )
    }
    
    init(source: otpSource){
        self.source = source
    }
    



    func navigate(){
        switch source {
        case .forgetPassword:
            print("forget")
        case .signUp:
            print("signup")
        case .changePassword:
            print("Change Password")
        }
    }
    
    func startTimer(){
        remainingSec = 10
        canResend = false
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] timer in
            guard let self = self else {return}
            if self.remainingSec > 0{
                self.remainingSec -= 1
            }else{
                self.canResend = true
                timer.invalidate()
            }
        })
    }
    
    func resendCode(){
        guard canResend else{return}
        print("Start Timer")
        startTimer()
    }
    
    func verifyOTP() {
        switch source {
        case .forgetPassword:
            destination = .resetPassword(.forgetPassword)
        case .signUp:
            gotoHome()
        case .changePassword:
            isVerified = true   // ← triggers onComplete instead of AuthRoute
        }
    }
    
    func gotoHome(){
        destinationHome = .home
//        if isValidEmail(email) && (validatePassword(password: password, confirmPassword: password) != nil){
//
//        }
    }
    
}
