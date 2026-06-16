//
//  PatreonCard.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 09.06.26.
//

import SwiftUI
import Combine

struct PatreonCard: View {
    @State var isConnected = true
    var body: some View {
        VStack{
            HStack(){
                Image("Icon_Patreon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(.horizontal)
                VStack(spacing:0){
                    Text("Patreon")
                        .font(.system(size: 16, weight: .heavy))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(isConnected ? "Connected" : "Not Connected")
                        .font(.system(size: 16, weight: .heavy))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("tier: \(isConnected ? "Super Fan": "unspecified")" )
                        .font(.system(size: 14, weight: .light))
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("Active since 2025 Jan")
                        .font(.system(size: 14, weight: .light))
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)

                }
                Spacer()
                HStack{
                    Image(systemName: isConnected ? "checkmark":"xmark")
                        .foregroundStyle(Color.white)
                        .scaledToFit()
//                        .frame(width: 25, height: 25)
                    Text(isConnected ? "Linked":"Not Linked")
                        .foregroundStyle(Color.white)
                        .bold()
                        .font(.system(size: 13, weight: .semibold))
                }
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.red)
                )
                .padding(.trailing,10)
                


            }
            .padding(5)
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black)
                .stroke(Color.red,lineWidth: 2)
        )
        .padding()
    }
}

#Preview {
    PatreonCard(isConnected: false  )
}
