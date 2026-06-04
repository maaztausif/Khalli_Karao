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

    var isSecureField: Bool 

    var textColor: Color = .black
    var borderColor: Color = .gray
    var focusedBorderColor: Color = .yellow
    var backgroundColor: Color = .clear

    @State private var isSecured = true
    @FocusState private var isFocused: Bool

    var body: some View {

        HStack {

            Group {

                if isSecureField {

                    if isSecured {

                        SecureField(title, text: $text)

                    } else {

                        TextField(title, text: $text)
                    }

                } else {

                    TextField(title, text: $text)
                }
            }
            .foregroundColor(textColor)
            .focused($isFocused)

            if isSecureField {

                Button {
                    isSecured.toggle()
                } label: {
                    Image(
                        systemName: isSecured
                        ? "eye.slash"
                        : "eye"
                    )
                    .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .frame(height: 50)
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    isFocused
                    ? focusedBorderColor
                    : borderColor,
                    lineWidth: 1
                )
        )
        .padding(.horizontal, 10)
        .onChange(of: isFocused) { _, focused in
            if focused {
                onFocus?()
            }
        }
    }
}

#Preview {

    @Previewable @State var text = ""

    ZStack {

        Color.white
            .ignoresSafeArea()

        CustomTextField(
            title: "Password",
            text: $text,
            isSecureField: false,
            textColor: .black,
            borderColor: .gray,
            focusedBorderColor: Color(hex: "#ECBB40"),
            backgroundColor: .clear
        )
        .padding()
    }
}
