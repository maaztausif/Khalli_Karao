//
//  UpdateProfileView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 09.06.26.
//

import SwiftUI
import Combine

struct ProfileUpdateView:View {
    @StateObject var viewModel = UpdateProfileViewModel()
    
    var body: some View {
        GeometryReader{ geometry in
            
            let size = geometry.size.width * 0.25
            
            VStack{
                KhalliKaraoView(size: size)
                    .padding(.top,20)
                
                Row(title: "Full Name", value: "Name",isTextField: true, textFeild: $viewModel.txtName)
                Row(title: "Date Of Birth", value: "DOB",isTextField: true, textFeild: $viewModel.dob)
                
                RectangleButton(title: "Update", backgroundColor: .yellow, textColor: .black, borderColor: .clear) {
                    print("update")
                    
                }
                .padding(.top)
            }
        }
        .onChange(of: viewModel.txtName) { oldValue, newValue in
            print(newValue)
        }
        .onReceive(viewModel.$dob) { value in
            print(value)
        }
    }
}

#Preview {
    ProfileUpdateView()
}
