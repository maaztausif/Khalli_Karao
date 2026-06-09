//
//  ViewRecentViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 07.06.26.
//

import SwiftUI
import Combine

final class ViewRecentViewModel: ObservableObject {
    
    @Published var question: String
    @Published var title: String

     init(question: String, title: String) {
         self.question = question
         self.title = title
     }
}
