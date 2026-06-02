//
//  SplashPage.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 31.05.26.
//

import SwiftUI
import Combine

struct SplashView: View {

    @EnvironmentObject var router: AppRouter
    @StateObject private var viewModel = SplashViewModel()

    var body: some View {

        GeometryReader { geometry in

            VStack(spacing: 15) {

                KhalliKaraoView(
                    size: geometry.size.width * 0.5
                )

                Text("Khalli Karao!")
                    .font(.system(size: 25, weight: .black))
                    .foregroundColor(.white)

                Text("Your Question and Answered!")
                    .font(.system(size: 18, weight: .light))
                    .foregroundColor(.gray)

                Rectangle()
                    .fill(Color.white)
                    .frame(width: 50, height: 2)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.black)
        .onAppear {
            viewModel.checkAuthentication()
        }
        .onReceive(viewModel.$destination.compactMap { $0 }) { route in
            router.navigate(to: route)
        }
    }
}

    #Preview {
        SplashView()
            .environmentObject(AppRouter())

    }
