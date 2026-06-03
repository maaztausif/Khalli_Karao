//
//  CIrcle.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 03.06.26.
//

import SwiftUI


struct CircularView:View {
    var body: some View {
        
        VStack {
            ZStack {
                
                Circle()
                    .fill(Color.yellow.opacity(0.3))
                    .frame(width: 150, height: 150)
                
                
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 100, height: 100)
                Image(systemName: "checkmark")
                    .frame(width: 50, height: 50)
            }
            
//            Text("Password Reset!")
//            Text("Your password has been updated successfully. You can now sign in with your new password.")
//                .padding(20)
//                .multilineTextAlignment(.center)
//                .foregroundColor(.gray)
        }
    }
}

#Preview {
    CircularView()
}
