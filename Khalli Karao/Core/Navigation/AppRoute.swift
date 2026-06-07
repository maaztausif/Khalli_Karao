//
//  AppRoute.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

enum AppRoute {
    case splash
    case welcome
    case auth(AuthRoute)
    case home
    case recentMessageView(question:String)
}

enum TabRoute: Hashable {
    case home
    case search
    case profile
}

enum HomeRoute: Hashable {
    case viewMessage(String)
}
