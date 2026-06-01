//
//  RectangleViewButton.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

import SwiftUI

struct RectangleButton: View {

    let title: String
    let backgroundColor: Color
    let textColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {

            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(backgroundColor)
                .cornerRadius(12)
        }
        .padding([.leading, .trailing],20)
    }
}

#Preview {
    RectangleButton(
        title: "Get Started",
        backgroundColor: .yellow,
        textColor: .black,
        action: {}
    )
    .padding()
}
