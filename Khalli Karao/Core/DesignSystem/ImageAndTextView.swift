//
//  ImageAndTextView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 04.06.26.
//

import SwiftUI

struct ImageAndTextView:View {
    var image:String
    var text:String
    var body: some View {
        HStack{
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(10)
                .foregroundColor(.red)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.yellow.opacity(0.4))
                )
            Text(text)
                .foregroundColor(.black)
                .fontWeight(.semibold)
                .font(.system(size: 17))
            Spacer()
        }
        .padding([.leading,.trailing],20)
    }
}

#Preview {
    ImageAndTextView(image: "bell.fill", text: "tester")
}
