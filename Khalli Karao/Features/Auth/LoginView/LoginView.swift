//
//  LoginView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

import SwiftUI

struct LoginView: View {

    @EnvironmentObject var router: AppRouter

    var body: some View {

        VStack {

            Text("Login")

            Button("Login Success") {
//                router.navigate(to: .home)
            }

            Button("Register") {
//                router.navigate(to: .register)
            }
        }
    }
}
