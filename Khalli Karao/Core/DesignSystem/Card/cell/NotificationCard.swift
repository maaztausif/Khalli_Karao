//
//  NotificationCard.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 14.06.26.
//

import SwiftUI

struct NotificationCard:View {
    var isVideo:Bool
    @Binding var title:String
    var time:String = "1 day ago"
    var message:String = "Your message was received! Check the YouTube channel for answers."
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: isVideo ? "":"bell.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .scaledToFit()
                    .foregroundStyle(Color.yellow)
                Text(title)
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }
            .padding(.horizontal)
            HStack{
                Image(systemName: isVideo ? "play.rectangle.fill":"envelope.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(isVideo ? .red:.yellow)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.31))
                    )
//                Spacer()
                VStack(alignment: .leading){
                    Text("Khalli Karao!. \(time)")
                        .foregroundColor(Color.white.opacity(0.7))
                    Text("\(message)")
                        .foregroundColor(Color.white.opacity(0.7))
                        .font(.system(size: 20, weight: .black))
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal,5)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 13)
                .fill(Color(.darkGray))
        )
        .padding()
        
    }
}

#Preview {
    NotificationCard(isVideo: true, title: .constant("New Video"))
}
