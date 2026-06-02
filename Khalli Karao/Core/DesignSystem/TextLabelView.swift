//
//  TextLabel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//

import SwiftUI

struct TextLabelView: View {
    var text: String
    
    var body: some View {
        HStack{
            Text(text)
                .foregroundColor(.primary)
                .font(.system(size: 20, weight: .bold, design: .rounded))
            Spacer()
        }
        
    }
}

#Preview {
    TextLabelView(text: "hello")
}
