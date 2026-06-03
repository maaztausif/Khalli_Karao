//
//  OTPView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

import SwiftUI
import Combine

struct OTPView: View {

    @EnvironmentObject var authRouter:AuthRouter
    @StateObject private var viewModel:OtpViewModel
    
    init(viewModel:OtpViewModel){
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        
        GeometryReader { geometry in
            
            
            VStack {
                KhalliKaraoView(size: geometry.size.width*0.2)
                    .padding(.top,50)
                RectangleView(isImage: "email", email: "Maaz@gmail.com")
                    .padding(.top,20)
                OTPTextField(otp: $viewModel.otp)
                    .padding(.top,geometry.size.height/9)
                HStack{
                    Text("Resend code in")
                        .foregroundColor(.gray)
                    Text(viewModel.timerText)
                }
                RectangleButton(title: "Send Resend Code", backgroundColor: .yellow.opacity(0.4), textColor: .black, borderColor: .gray) {
                    if viewModel.canResend{
                        print("chale ga")

                        viewModel.resendCode()
                    }else{
                        print("nai chale ga")
                    }
                }
                .disabled(!viewModel.canResend)

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onReceive(viewModel.$destination.compactMap{$0}) { route in
                authRouter.push(route)
            }
            .onAppear {
                viewModel.startTimer()
                switch viewModel.source {
                case .forgetPassword:
                    print("forget password")
                case .signUp:
                    print("sign up")
                }
            }
        }
        .onChange(of: viewModel.otp) { _, newValue in

            if newValue.count == 6 {
                viewModel.verifyOTP()
            }
        }
    }
        
}
#Preview {
    OTPView(viewModel: OtpViewModel.init(source: .forgetPassword))
}
