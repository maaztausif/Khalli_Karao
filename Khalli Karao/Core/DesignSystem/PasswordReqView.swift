//
//  PasswordReqView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 03.06.26.
//

import SwiftUI

struct PasswordRequirementView: View {

    let text: String
    let isValid: Bool

    var body: some View {

        HStack {

            Image(systemName: isValid
                  ? "checkmark.circle.fill"
                  : "xmark.circle.fill")
                .foregroundColor(
                    isValid ? .green : .red
                )

            Text(text)
                .foregroundColor(.black)

            Spacer()
        }
    }
}
