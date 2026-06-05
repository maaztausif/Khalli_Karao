//
//  TabRouter.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 04.06.26.
//

import SwiftUI
import Combine

final class TabRouter: ObservableObject {

    @Published var selectedTab: TabRoute = .home

    func navigate(to route: TabRoute) {
        selectedTab = route
    }
}
