//
//  HomeView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var router: AppRouter

    var body: some View {
        VStack {
            HStack{
                Image(systemName: "envelope.fill")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .padding(.leading)

                Text("Ask Me")
                    .font(.system(size: 22,weight: .bold))
                    .foregroundStyle(.black)
                Spacer()
                Button(action: {
//                    router.navigate(to: .home)
                }) {
                    Image(systemName: "bell.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        
                }
                .padding(.trailing)
            }
            Rectangle()
                .fill(Color.gray)
                .frame(height: 0.5)
//                .padding(.horizontal, 20)
            ScrollView {
                VStack{
                    HomeCard(name: "Testing")
                    
                    
                    Spacer()
                }
            }
            
        }
      
    }
}

#Preview {
    HomeView()
}
