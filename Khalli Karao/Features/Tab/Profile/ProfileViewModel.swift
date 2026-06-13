//
//  ProfileViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 05.06.26.
//

import SwiftUI
import Combine

final class ProfileViewModel:ObservableObject{
    
    @Published var destination:ProfileRoute?
    @Published var updateSheet:Bool = false
    @Published var isNotification = false {
        didSet {
            print("didSet fired")
        }
    }
    @Published var isVideoAlert:Bool = false
    
    func forNotification(){
        if isNotification{
            
        }else{
            
        }
    }
    
    func forVideoAlert(){
        if isVideoAlert{
            
        }
    }
    
    func updateNotificationSetting() {

           print("Notification: \(isNotification)")
       }
    
    func gotoOtpScreen(){
        destination = .otpView
    }
}
