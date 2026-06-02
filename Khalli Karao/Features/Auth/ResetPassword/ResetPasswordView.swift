//
//  ResetPasswordView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

import SwiftUI

struct ResetPasswordView: View {

    @EnvironmentObject var router: AppRouter

    var body: some View {

        VStack {

            Text("Reset Password")

            Button("Done") {
                router.navigate(to: .home)
            }
        }
    }
}
