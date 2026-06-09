//
//  ProfileView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 05.06.26.
//

import SwiftUI
import Combine

struct ProfileView:View {
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing:10) {
                Text("MK")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(width: 75, height: 75)
                    .background(Color.yellow)
                    .clipShape(Circle())
                
                
                Text("Major")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 20, weight: .heavy))
                Text("major@gmail.com")
                    .foregroundColor(.gray)                    .font(.system(size: 18, weight: .light))
            }
            .frame(maxWidth: .infinity)
            .frame(height: 220)
            .background(Color.black)
            
            VStack{
                PatreonCard()
            }
            
            VStack(spacing: 0) {
                
                Row(
                    title: "Full Name",
                    value: "Ahmad Raza",
                    textFeild: .constant("")
                )
                
                Divider()
                
                Row(
                    title: "Email",
                    value: "ahmad@example.com",
                    textFeild: .constant("")

                    
                )
                
                Divider()
                
                Row(
                    title: "Member Since",
                    value: "Jan 2024",
                    textFeild: .constant("")

                    
                    
                )
            }
            .background(Color.white)
            .clipShape(
                RoundedRectangle(cornerRadius: 24)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                
            )
            .padding()
            
            RectangleButton(title: "Update", backgroundColor: .yellow, textColor: .black, borderColor: .clear) {
                
            }
            
            VStack{
                ToggleRow(
                    title: "Notification",
                    notificationsEnabled: $viewModel.isNotification,
                )
                Divider()
                ToggleRow(
                    title: "New Video Alert",
                    notificationsEnabled: $viewModel.isNotification,
                )
            }
            .background(Color.white)
            .clipShape(
                RoundedRectangle(cornerRadius: 24)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                
            )
            .padding()
            
            
            RectangleButton(title: "Sign Out", backgroundColor: .white, textColor: .red, borderColor: .red) {
                
            }
            
        }
        .ignoresSafeArea(edges: .top)
        .onChange(of: viewModel.isNotification) { _, value in
            
            print("🔥 ONCHANGE FIRED")
            print("New Value: \(value)")
        }
        
    }
    
}

#Preview {
    ProfileView()
}
