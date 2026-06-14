//
//  NotificationViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 14.06.26.
//

import SwiftUI
import Combine

final class NotificationViewModel:ObservableObject{
    struct question: Identifiable {
        var id: UUID
        var isVideo:Bool
        var question: String
    }
    
    let questions: [question] = [
        question(id: UUID(),isVideo: true, question: "What is your name?"),
        question(id: UUID(),isVideo: false, question: "What is your favourite food?")]
}
