//
//  RootView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

import SwiftUI

struct RootView: View {

    @StateObject private var router = AppRouter()

    var body: some View {

        switch router.currentRoute {

        case .splash:
            SplashView()
                .environmentObject(router)

        case .auth:
            AuthContainerView()

        case .home:
            HomeView()
                .environmentObject(router)

//        case .register:
//            SignupView()
//                .environmentObject(router)
            
        case .welcome:
            WelcomeView()
                .environmentObject(router)
        }
    }
}
