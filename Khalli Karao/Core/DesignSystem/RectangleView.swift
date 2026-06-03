//
//  RectangleView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 03.06.26.
//

import SwiftUI

struct RectangleView:View {
    var isImage:String?
    var email:String
    
    var body: some View{
        VStack{
            HStack{
                VStack{
                    if isImage != nil{
                        Image(systemName: "mail")
                            .font(.system(size: 30))
                    }
                }

                VStack{
                    Text("Code sent to \(Text(email).bold()). Check your inbox or spam folder.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                }
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray,lineWidth: 1)
                .fill(Color.yellow.opacity(0.2))

        }
        
    }
}

#Preview {
    RectangleView(isImage: "mail",email: "maaz@gmail.com")
}
