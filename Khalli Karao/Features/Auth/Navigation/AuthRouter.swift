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
    @Published var rootRoute: AuthRoute = .login
    
    init(rootRoute: AuthRoute) {
          self.rootRoute = rootRoute
      }
    
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
    
    func replaceRoot(with route: AuthRoute) {
        rootRoute = route
        path = NavigationPath()
    }
    
}
