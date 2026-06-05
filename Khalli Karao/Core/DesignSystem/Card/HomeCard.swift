//
//  HomeCard.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 05.06.26.
//

import SwiftUI
import Combine

struct HomeCard: View {
    var name:String
    var isPatreonMember:Bool = true
    var body: some View {
        VStack(alignment: .leading){
            Text("Hi, \(name) 👋")                .foregroundStyle(Color.white)
                .font(.system(size: 22,weight: .heavy))
            
            Text("Send your question to Khalli Karao")
                .foregroundStyle(.gray)
            
            if isPatreonMember {
                HStack {
                    Image("Icon_Patreon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Text("Patreon Member")
                        .font(.system(size: 17,weight: .heavy))
                        .foregroundStyle(.white)
                    
                }
                .padding(2)
                .padding(.horizontal,6)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                )
            }else{
                RectangleButton(title: "Become a Patreon for perks", backgroundColor: .red, textColor: .white, borderColor: .clear) {
                    //
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.black)
        .cornerRadius(20)
        .padding()
      
    }
}

#Preview {
    HomeCard(name: "yasir",isPatreonMember: true)
}
