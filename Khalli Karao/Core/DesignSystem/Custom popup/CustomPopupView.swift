//
//  CustomPopup.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 13.06.26.
//

import SwiftUI

struct CustomPopupView: View {

    let title: String
    let message: String
    let isSuccess: Bool
    let onDismiss: () -> Void

    var body: some View {

        VStack(spacing: 20) {

            Image(
                systemName: isSuccess
                ? "checkmark.circle.fill"
                : "xmark.circle.fill"
            )
            .font(.system(size: 60))
            .foregroundColor(
                isSuccess
                ? .green
                : .red
            )

            Text(title)
                .font(.headline)

            Text(message)

            Button("OK") {

                onDismiss()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}
