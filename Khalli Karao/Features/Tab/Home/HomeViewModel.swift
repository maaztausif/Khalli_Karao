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
    
    
    struct question: Identifiable {
        var id: UUID
        var question: String
    }
    
    @Published var sendMessage = false
    
    
    let questions: [question] = [
        question(id: UUID(), question: "What is your name?"),
//        question(id: UUID(), question: "What is your age?"),
//        question(id: UUID(), question: "What is your favourite movie?"),
//        question(id: UUID(), question: "What is your favourite food?"),
//        question(id: UUID(), question: "What is your name?"),
//        question(id: UUID(), question: "What is your age?"),
//        question(id: UUID(), question: "What is your favourite movie?"),
//        question(id: UUID(), question: "What is your favourite food?"),
//        question(id: UUID(), question: "What is your name?"),
//        question(id: UUID(), question: "What is your age?"),
//        question(id: UUID(), question: "What is your favourite movie?"),
//        question(id: UUID(), question: "What is your favourite food?"),
//        question(id: UUID(), question: "What is your name?"),
//        question(id: UUID(), question: "What is your age?"),
//        question(id: UUID(), question: "What is your favourite movie?"),
        question(id: UUID(), question: "What is your favourite food?")]
    
    func gotoViewMessage(question:String,title:String){
        destination = .viewMessage(question: question,title: title)
    }
    
}

