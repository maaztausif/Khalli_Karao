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
    @StateObject private var profileRouter = ProfileRouter()
    
    var body: some View {

        TabView(selection: $router.selectedTab) {

            // HOME TAB
            NavigationStack(path: $homeRouter.path) {

                HomeView()
                    .navigationDestination(for: HomeRoute.self) { route in

                        switch route {

                        case .viewMessage(let question,let title):

                            ViewRecentMessageView(
                                question: question,
                                title:title
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
                    "Videos",
                    systemImage: "video.fill"
                )
            }
            .tag(TabRoute.search)

            // PROFILE TAB
        NavigationStack(path: $profileRouter.path) {
            ProfileView()
                .navigationDestination(for: ProfileRoute.self) { route in
                    switch route {
                    case .otpView:
                        OTPView(
                                viewModel: OtpViewModel(source: .changePassword),
                                onComplete: {
                                    profileRouter.push(.passwordChange) // whatever your next profile route is
                                }
                            )
                        .toolbar(.hidden, for: .tabBar)

                    case .passwordChange:
                        ResetPasswordView(
                            viewModel: ResetPasswordViewModel(source: .updatePassword),
                            onComplete: {
                                profileRouter.popToRoot()
                            }
                        )                            .toolbar(.hidden, for: .tabBar)
                    case .updateProfile:
                        Text("Coming soon") // placeholder until OTPView compiles
//                        ResetPasswordView(viewModel: ResetPasswordViewModel.init(source: .updatePassword))
                            .toolbar(.hidden, for: .tabBar)
                    }
                }
        }
        .environmentObject(profileRouter)
        .tabItem {
            Label("Profile", systemImage: "person.fill")
        }
        .tag(TabRoute.profile)
                    }
                    .environmentObject(router)
    }
}
