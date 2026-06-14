//
//  HomeViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 06.06.26.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    
    @Published var destination:HomeRoute?
    @Published var showPopup = false
    @Published var popupType: PopupType = .success
    @Published var popupMessage: PopupMessage = .success("")
    
    struct question: Identifiable {
        var id: UUID
        var question: String
    }
    
    @Published var sendMessage = false
    @Published var didSendMessage = false
    
    @Published var question = ""
    @Published var isSendButtonClicked = false
    @State var homeQuestion = ""
    
    let questions: [question] = [
        question(id: UUID(), question: "What is your name?"),
        question(id: UUID(), question: "What is your favourite food?")]
    
    func gotoViewMessage(question:String,title:String){
        destination = .viewMessage(question: question,title: title)
    }
    
    func gotoNotification(){
        destination = .notificationView
    }
    
    func sendMessageAPI(){
        
        if self.question.isEmpty{
            if self.isSendButtonClicked{
                popupType = .Empty
                popupMessage = .empty("Text Field Is Empty")
                showPopup = true
            }
        }else{
            showPopup = true
            popupType = .success
            popupMessage = .success("Your Email Has Been Sent")
        }
    }
    
}

