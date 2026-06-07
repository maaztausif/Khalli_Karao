//
//  MessageCard.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 06.06.26.
//

import SwiftUI

struct SendMessageCard: View {

    @State private var category = "Select Category"

    let question: String

    @Binding var text: String

    @State private var editorHeight: CGFloat = 120

    var body: some View {

        VStack {

            Text("SELECT SUBJECT")
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

            DropdownView(
                options: [
                    "Technology",
                    "Sports",
                    "Education"
                ],
                selectedOption: $category
            )

            Text(
                question.isEmpty
                ? "Write Message"
                : question
            )
            .foregroundColor(.gray)
            .padding(.top, 8)
            .padding(.leading, 5)
            .allowsHitTesting(false)

            ZStack(alignment: .topLeading) {

                if text.isEmpty {

//                    Text(
//                        question.isEmpty
//                        ? "Write Message"
//                        : question
//                    )
//                    .foregroundColor(.gray)
//                    .padding(.top, 8)
//                    .padding(.leading, 5)
                }

                TextField(
                    "Write Message",
                    text: $text,
                    axis: .vertical
                )
                .lineLimit(4...10)
                .onChange(of: text) { _, value in
                    print("Typing: \(value)")
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.2))
            )

            RectangleButton(
                title: "Send Message",
                backgroundColor: .yellow,
                textColor: .black,
                borderColor: .clear,
                image: "envelope.fill",
                isImageRight: true
            ) {
                print(text)
            }
            .padding(.vertical)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 2)
        )
        .padding()
    }
}

#Preview {
    @Previewable @State var message = ""

    SendMessageCard(
        question: "Write your question...",
        text: $message
    )
}
