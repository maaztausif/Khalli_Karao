//
//  HomeRouter.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 07.06.26.
//

import SwiftUI
import Combine

final class HomeRouter: ObservableObject {

    @Published var path = NavigationPath()

    func push(_ route: HomeRoute) {
        path.append(route)
    }
}
