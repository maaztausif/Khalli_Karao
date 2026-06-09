//
//  ProfileViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 05.06.26.
//

import SwiftUI
import Combine

final class ProfileViewModel:ObservableObject{
    
    @Published var isNotification = false {
        didSet {
            print("didSet fired")
        }
    }
    @Published var isVideoAlert:Bool = true
    
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
}
