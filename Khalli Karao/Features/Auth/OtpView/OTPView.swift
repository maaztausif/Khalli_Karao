//
//  OTPView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

import SwiftUI

struct OTPView: View {

    @EnvironmentObject var authRouter:AuthRouter
    @StateObject private var viewModel:OtpViewModel
    
    init(viewModel:OtpViewModel){
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {

        VStack {

            Text("OTP Screen")

            Button("Verify") {
                authRouter.push(.resetPassword)
            }
        }
    }
}
