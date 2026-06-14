//
//  NotificationView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 14.06.26.
//

import SwiftUI

struct NotificationView: View {
    
    @StateObject var viewModel = NotificationViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            ScrollView {
                
                LazyVStack {
                    
                    ForEach(viewModel.questions) { question in
                        
                        Button {
                            
                        } label: {

                            NotificationCard(
                                isVideo: question.isVideo, title: .constant(""),
                                
                                
                            )
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NotificationView()
}
