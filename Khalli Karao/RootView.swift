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

        case .login:
            LoginView()
                .environmentObject(router)
//
//        case .register:
////            RegisterView()
////                .environmentObject(router)
//
        case .home:
            HomeView()
                .environmentObject(router)
//
//        case .profile:
////            ProfileView()
////                .environmentObject(router)
        }
    }
}
