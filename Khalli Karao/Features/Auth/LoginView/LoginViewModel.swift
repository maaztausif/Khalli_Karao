//
//  LoginViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {

    private let router: AppRouter

    init(router: AppRouter) {
        self.router = router
    }

    func loginSuccess() {
//        router.navigate(to: .home)
    }
}
