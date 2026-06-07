//
//  MessageCard.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 06.06.26.
//

import SwiftUI
import Combine

struct SendMessageCard: View {
    
    @State private var category = "Select Category"
    let question: String
    @Binding var text: String

    var body: some View {
        VStack{

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
            
            HStack {
                Text("YOUR MESSAGE")
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
            
            VStack {
                
                TextField(question == "" ? "Write Message" : question, text: $text)
                    .foregroundColor(.black)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.2))
            )
//            .padding(.horizontal)
            
            RectangleButton(title: "Send Message", backgroundColor: .yellow, textColor: .black, borderColor: .clear,image: "envelope.fill",isImageRight: true) {
                //
            }
            .padding(.vertical)
            
        }
        .padding()
//        .cornerRadius(20)
        .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 2)
            )
        .padding()
    }
}

#Preview {
    SendMessageCard(question: "asdasd", text: .constant(""))
}
