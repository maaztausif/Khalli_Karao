//
//  TextView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

import SwiftUI

struct CustomTextField: View {

    let title: String
    @Binding var text: String
    var onFocus: (() -> Void)?

    var textColor: Color = .black
    var borderColor: Color = .gray
    var focusedBorderColor: Color = .yellow
    var backgroundColor: Color = .clear

    @FocusState private var isFocused: Bool

    var body: some View {

        TextField(title, text: $text)
            .foregroundColor(textColor)
            .padding()
            .frame(height: 56)
            .background(backgroundColor)
            .focused($isFocused)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        isFocused ? focusedBorderColor : borderColor,
                        lineWidth: 1
                    )
                    .background(Color.yellow.opacity( isFocused ? 0.1 : 0))
            )
            .padding([.leading,.trailing],10)
            .onChange(of: isFocused) { _, focused in
                if focused {
                    onFocus?()
                }
            }
    }
}


#Preview {
    @Previewable @State var email = ""

    ZStack {
        Color.white
            .ignoresSafeArea()

        CustomTextField(
            title: "Email",
            text: $email,
            onFocus: {
                print("Email selected")
            },
            textColor: .black,
            borderColor: .gray,
            focusedBorderColor: Color(hex: "#ECBB40"),
            backgroundColor: Color.clear
        )
        .padding()
    }
}
