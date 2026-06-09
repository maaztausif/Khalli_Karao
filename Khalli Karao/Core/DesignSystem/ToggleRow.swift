//
//  ToggleRow.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 09.06.26.
//

import SwiftUI
import Combine


struct ToggleRow: View {
    
    let title: String
    @Binding var notificationsEnabled:Bool
    
    var body: some View {
        
        HStack {
            
            Text(title)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.black)
            
            Spacer()
                Toggle(
                    "",
                    isOn: $notificationsEnabled
                )
                .labelsHidden()
                .padding()
            
        }
        .padding(.horizontal, 24)
        .frame(height: 90)
    }
}

