//
//  AuthRouter.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

import SwiftUI
import Combine

final class AuthRouter: ObservableObject {

    @Published var path = NavigationPath()

    func push(_ route: AuthRoute) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func popToRoot() {
        path = NavigationPath()
    }
}
