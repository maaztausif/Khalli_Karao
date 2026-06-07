//
//  HomeView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var router: AppRouter
    @State var selection = ""
    @State private var question = ""
    
    @StateObject private var viewModel = HomeViewModel()
    
    
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
                    HStack {
                        Text("Send A Message")
                            .font(.system(size: 22,weight: .bold))
                            .foregroundStyle(.black)
                            .padding(.horizontal)
                        Spacer()
                    }
                    ZStack{
                 
                        SendMessageCard(question: "Write Question", text: $question)
                            .blur(radius: 3)
                        RectangleButton(title: "Send Message", backgroundColor: .yellow, textColor: .black, borderColor: .clear) {
                            viewModel.sendMessage = true
                        }
                    }
                }
                
                HStack {
                    Text("Recent Message")
                        .font(.system(size: 22,weight: .bold))
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                    Spacer()
                }
                
                LazyVStack{
                    
                    ForEach (viewModel.questions){ question in
                        
                        RecentMeesageCard(issueTitle: "Girlfriend Issues", day: "2 days ago", message: "meri girlfriend ko kya karega")
                    }
                }
                
                Spacer()
            }
        }
        .sheet(isPresented: $viewModel.sendMessage) {
            SendMessageCard(question: "Write Question", text: $question)
                .presentationDetents([.height(.infinity)])
                .presentationDragIndicator(.visible)
        }
        
    }
    
}


#Preview {
    HomeView()
}
