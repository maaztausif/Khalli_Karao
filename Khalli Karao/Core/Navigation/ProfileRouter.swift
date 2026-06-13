//
//  ProfileRouter.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 10.06.26.
//

import SwiftUI
import Combine

final class ProfileRouter: ObservableObject {

    @Published var path = NavigationPath()

    func push(_ route: ProfileRoute) {
        path.append(route)
    }
    func popToRoot() {
        path = NavigationPath()
    }
}
