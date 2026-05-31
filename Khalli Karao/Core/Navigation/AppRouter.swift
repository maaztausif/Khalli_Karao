//
//  AppRouter.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

import Foundation
import Combine

final class AppRouter: ObservableObject {

    @Published var currentRoute: AppRoute = .splash

    func navigate(to route: AppRoute) {
        currentRoute = route
    }
}
