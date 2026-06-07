//
//  TabView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 04.06.26.
//

import SwiftUI
import Combine

import SwiftUI

struct MainTabView: View {

    @StateObject private var router = TabRouter()
    @StateObject private var homeRouter = HomeRouter()
    
    var body: some View {

        TabView(selection: $router.selectedTab) {

            // HOME TAB
            NavigationStack(path: $homeRouter.path) {

                HomeView()
                    .navigationDestination(for: HomeRoute.self) { route in

                        switch route {

                        case .viewMessage(let question):

                            ViewRecentMessageView(
                                question: question
                            )
                            .toolbar(.hidden, for: .tabBar)
                        }
                    }
            }
            .environmentObject(homeRouter)
            .tabItem {
                Label(
                    "Home",
                    systemImage: "house.fill"
                )
            }
            .tag(TabRoute.home)

            // SEARCH TAB
            NavigationStack {

                SearchView()

            }
            .tabItem {
                Label(
                    "Search",
                    systemImage: "magnifyingglass"
                )
            }
            .tag(TabRoute.search)

            // PROFILE TAB
            NavigationStack {

                ProfileView()

            }
            .tabItem {
                Label(
                    "Profile",
                    systemImage: "person.fill"
                )
            }
            .tag(TabRoute.profile)
        }
        .environmentObject(router)
    }
}
