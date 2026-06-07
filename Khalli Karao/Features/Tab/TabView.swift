//
//  TabView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 04.06.26.
//

import SwiftUI
import Combine

struct MainTabView: View {

    @StateObject private var router = TabRouter()

    var body: some View {

        TabView(selection: $router.selectedTab) {

            HomeView( question: .constant(""))
                .tabItem {
                    Label(
                        "Home",
                        systemImage: "house.fill"
                    )
                }
                .tag(TabRoute.home)

            HomeView( question: .constant(""))
                .tabItem {
                    Label(
                        "Search",
                        systemImage: "magnifyingglass"
                    )
                }
                .tag(TabRoute.search)

            ProfileView()
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
