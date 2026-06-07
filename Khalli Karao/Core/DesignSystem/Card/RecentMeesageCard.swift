//
//  RecentMeesageCard.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 06.06.26.
//
import SwiftUI


struct RecentMeesageCard: View {
    var issueTitle: String
    var day: String
    var message: String
    var body: some View {
        VStack{
            HStack{
                HStack {
                    Text(issueTitle)
                        .foregroundStyle(.black)
                        .font(.system(size: 15,weight: .heavy))
                        .padding(7)
                }
                .background(.yellow.opacity(0.4))
                .cornerRadius(12)
                .padding()
                
                Spacer()
                Text(day)
                    .font(.system(size: 15,weight: .light))
                    .padding(.trailing)
                    .foregroundStyle(Color.gray)
            }
            
            Text(message)
                .lineLimit(1)
                .truncationMode(.tail)
                .font(.system(size: 15,weight: .light))
                .padding(.trailing)
                .foregroundStyle(Color.gray)
                .padding(.bottom)
            
        }
        .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 1)
            )
        .padding(.horizontal)
    }
}

#Preview {
    RecentMeesageCard(issueTitle: "Girlfriend Issues", day: "2 days ago", message: "main apni girlfriend se breakup karna chahta...")
}
