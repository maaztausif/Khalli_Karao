//
//  WelcomeViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

import SwiftUI
import Combine

final class WelcomeViewModel: ObservableObject {

    @Published var destination: AppRoute?

    func gotoLoginPage() {
        self.destination = .login
    }
    
    func gotoSignupPage() {
        self.destination = .register
    }
}
