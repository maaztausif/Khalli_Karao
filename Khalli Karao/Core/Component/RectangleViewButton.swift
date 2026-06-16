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
    let borderColor: Color
    var image:String = ""
    var isImageLeft:Bool = false
    var isImageRight:Bool = false
    let action: () -> Void
  
//    var isDisabled = false
    var body: some View {
        Button(action: action) {

            HStack {
                Spacer()
                if isImageLeft{
                   Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(.leading)

                }
                Text(title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(textColor)
//                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
//                    .background(
//                        RoundedRectangle(cornerRadius: 12)
//                            .fill(backgroundColor)
//                    )
                if isImageRight{
                    Image(systemName: image)
                         .resizable()
                         .scaledToFit()
                         .frame(width: 30, height: 30)
                         .padding(.leading)
                         .foregroundStyle(.black)

                }
                Spacer()

                    
            }
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(backgroundColor)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(borderColor, lineWidth: 2)
            )
            .padding([.leading, .trailing],50)
        }
//        .disabled(isDisabled)
    }
}

#Preview {
    RectangleButton(
        title: "Get Started",
        backgroundColor: .yellow,
        textColor: .black, borderColor: .black,image: "Patreon",isImageLeft: true,
        action: {}
    )
    .padding()
}
