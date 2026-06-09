//
//  ViewRecentMessage.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 07.06.26.
//

import SwiftUI
import Combine

struct ViewRecentMessageView: View {
    
    @StateObject private var viewModel: ViewRecentViewModel

//    @State private var category = "Select Category"

//    let question: String
//
//    @State var text: String

    @State private var editorHeight: CGFloat = 120
    
    init(question: String,title:String) {
        _viewModel = StateObject(
            wrappedValue: ViewRecentViewModel(
                question: question,
                title: title
            )
        )
    }

    var body: some View {

        VStack {

            Image("Icon_KhalliKarao")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.vertical)
            VStack {
                Text("Subject")
                    .font(.system(size: 22, weight: .bold))
//                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                Text(viewModel.title)
                    .foregroundStyle(.gray)
                    .font(.system(size: 22, weight: .bold))

                    .padding(.horizontal)
                    .padding(.top,5)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.yellow.opacity(0.2))
            )
            

            

            ScrollView {
                Text(
                    
                    viewModel.question
                )
                
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .leading)
                .foregroundColor(.gray)
                .padding(.leading, 5)
                .allowsHitTesting(false)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.1))
                )
            }

           

            Spacer()
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var message = ""

    ViewRecentMessageView(question: "q", title: "tester")
}
