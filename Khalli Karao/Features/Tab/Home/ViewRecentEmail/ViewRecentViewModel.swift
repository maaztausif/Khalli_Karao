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

     init(question: String) {
         self.question = question
     }
}
