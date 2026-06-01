//
//  SplashViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

import Foundation
import Combine

final class SplashViewModel: ObservableObject {

    @Published var destination: AppRoute?

    func checkAuthentication() {

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {

            let token = UserDefaults.standard.string(
                forKey: "accessToken"
            )

            self.destination = token != nil ? .home : .welcomeScreen
        }
    }
}
