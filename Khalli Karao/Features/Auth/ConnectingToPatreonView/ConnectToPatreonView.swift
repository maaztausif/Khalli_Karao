//
//  ConnectToPatreonView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 04.06.26.
//

import SwiftUI

struct ConnectToPatreonView:View {
    var body: some View {
        VStack{
            HStack{
                Image("Icon_KhalliKarao")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
                Image(systemName: "arrow.left.arrow.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding([.leading,.trailing],20)
                    .foregroundColor(.gray)
                
                Image("Icon_Patreon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
            }
            Text("Connecting to Patreon")
                .font(.system(size: 22,weight: .heavy))
                .padding(.top)
            Text("Please complete sign in \n in the browser window")
                .font(.system(size: 20,weight: .none))
                .foregroundStyle(.gray)
                .padding(.top)
                .multilineTextAlignment(.center)
            ProgressView(value: 0.5)
                .padding()
                .frame(width: 300)
                .tint(Color(hex: "#ECBB40"))
            
            
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ConnectToPatreonView()
}
