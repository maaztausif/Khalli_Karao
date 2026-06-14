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
}

enum TabRoute: Hashable {
    case home
    case search
    case profile
}

enum HomeRoute: Hashable {
    case viewMessage(question:String,title:String)
    case notificationView
}

enum ProfileRoute: Hashable {
    case updateProfile
    case otpView
    case passwordChange
}
