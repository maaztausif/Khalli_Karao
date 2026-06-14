//
//  TwoButtonPopupView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 14.06.26.
//

import SwiftUI

struct TwoButtonPopupView: View {

    let title: String
    let message: String

    let primaryButtonTitle: String
    let secondaryButtonTitle: String

    let onPrimaryTap: () -> Void
    let onSecondaryTap: () -> Void

    var body: some View {

        VStack(spacing: 20) {

            Text(title)
                .font(.title3)
                .fontWeight(.bold)

            Text(message)
                .multilineTextAlignment(.center)

            HStack(spacing: 15) {

                Button {

                    onSecondaryTap()

                } label: {

                    Text(secondaryButtonTitle)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                }

                Button {

                    onPrimaryTap()

                } label: {

                    Text(primaryButtonTitle)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(12)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(.horizontal, 30)
    }
}
