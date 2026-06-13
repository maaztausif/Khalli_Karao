//
//  Row.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 09.06.26.
//

import SwiftUI
import Combine

struct Row: View {
    
    let title: String
    let value: String
    var isTextField:Bool = false
    
    @Binding var textFeild:String
    
    var body: some View {
        
        HStack {
            
            Text(title)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.black)
            
            Spacer()
            if isTextField{
                TextField(value, text: $textFeild)
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
            }else{
                Text(value)
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
            }
            
        }
        .padding(.horizontal, 24)
        .frame(height: 90)
    }
}

#Preview {
    Row(title: "sa", value: "Asd", isTextField: true, textFeild: .constant(""))
    
}
