//
//  PatreonView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 04.06.26.
//

import SwiftUI
import Combine

struct PatreonBottomSheet:View {
    @StateObject private var viewModel = PatreonBottomSheetViewModel()
    @EnvironmentObject var authRouter: AuthRouter
    
    
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        
        VStack{
            HStack{
                Image("Icon_Patreon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
                VStack{
                    Text("Link Your Patreon")
                        .font(.system(size: 20,weight: .heavy))
                    Text("Verify Your Supporter Status")
                        .foregroundColor(.gray)
                    
                }
                .padding(.leading)
            }
            .padding(.bottom,30)
            ImageAndTextView(image: "star.fill", text: "Patreon badge on your messages")
                .padding([.top,.bottom],15)
            ImageAndTextView(image: "tray.badge.fill", text: "Priority visibility in inbox")
                .padding(.bottom,15)
            
            ImageAndTextView(image: "bell.fill", text: "Exclusive notifications")
            
            RectangleButton(title: "Connect With Patreon", backgroundColor: .red, textColor: .white, borderColor: .clear,image: "Patreon",isImage: true) {
                viewModel.connectToPatreon()
            }
            .padding(.top,20)
            RectangleButton(title: "Skip for now", backgroundColor: .clear, textColor: .gray, borderColor: .clear) {
                dismiss()
            }
            Spacer()
        }
        .padding(.top,40)
        .onReceive(viewModel.$shouldDissmiss) { shouldDismiss in
            
            if shouldDismiss {
                dismiss()
            }
        }
        .onReceive(viewModel.$destination.compactMap { $0 }) { route in
            dismiss()
            print("Navigating to: \(route)")
            authRouter.push(route)
        }
        
    }
    
}

#Preview {
    PatreonBottomSheet()
}
