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

        case .welcome:
            WelcomeView()
                .environmentObject(router)
                .onAppear {
                            print("Showing Welcome")
                        }

        case .auth(let initialRoute):
            AuthContainerView(
                initialRoute: initialRoute
            )
            .environmentObject(router)

        case .home:
            MainTabView()
                .environmentObject(router)
            
        case .recentMessageView(let question):
            ViewRecentMessageView(question: question)
                .environmentObject(router)
            
        }
    }
}
