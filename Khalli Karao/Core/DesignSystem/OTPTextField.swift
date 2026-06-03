//
//  OTPTextField.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 03.06.26.
//


import SwiftUI

struct OTPTextField: View {

    @Binding var otp: String
    @FocusState private var isFocused: Bool

    var body: some View {

        ZStack {

            TextField("", text: $otp)
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .focused($isFocused)
                .opacity(0.01)
                .onChange(of: otp) { _, newValue in

                    otp = String(newValue.prefix(6))

                    otp = otp.filter { $0.isNumber }
                }

            HStack(spacing: 12) {

                ForEach(0..<6, id: \.self) { index in

                    ZStack {

                        RoundedRectangle(cornerRadius: 12)
                            .stroke(
                                index == otp.count
                                ? Color.yellow
                                : Color.gray,
                                lineWidth: 1
                            )
                            .frame(width: 50, height: 55)

                        Text(character(at: index))
                            .font(.system(size: 24, weight: .bold))
                    }
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                isFocused = true
            }
        }
        .onAppear {
            isFocused = true
        }
    }

    private func character(at index: Int) -> String {

        guard index < otp.count else {
            return ""
        }

        let array = Array(otp)

        return String(array[index])
    }
}

#Preview {

    OTPTextField(
        otp: .constant("123")
    )
}
