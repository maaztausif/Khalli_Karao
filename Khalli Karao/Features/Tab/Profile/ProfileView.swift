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
        VStack{
            Text("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
