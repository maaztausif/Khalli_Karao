//
//  HomeView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 01.06.26.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    @EnvironmentObject var router: AppRouter
    @EnvironmentObject var homeRouter: HomeRouter
    
    @State var selection = ""

    @StateObject private var viewModel = HomeViewModel()
    
    
    var body: some View {
        ZStack {
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
                        viewModel.gotoNotification()
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
                            
                            SendMessageCard(question: "Write Question", text: $viewModel.homeQuestion, isSendButtonClicked: $viewModel.isSendButtonClicked)
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
                            
                            Button{
                                viewModel.gotoViewMessage(question: question.question,title: "\(question.id)")
                            }label: {
                                RecentMeesageCard(issueTitle: "Girlfriend Issues", day: "2 days ago", message: "meri girlfriend ko kya karega")
                            }
                        }
                    }
                    Spacer()
                }
            }
            .sheet(
                isPresented: $viewModel.sendMessage,
                onDismiss: {

                    
                    print("Sheet Dismissed")
                    print(viewModel.question)
                    viewModel.sendMessageAPI()
                    viewModel.question = ""
                    viewModel.isSendButtonClicked = false
                }
            ) {

                SendMessageCard(
                    question: "Write Question",
                    text: $viewModel.question, isSendButtonClicked: $viewModel.isSendButtonClicked
                )
                .presentationDetents([.height(.infinity)])
                .presentationDragIndicator(.visible)
            }
            .onReceive(
                viewModel.$destination.compactMap { $0 }
            ) { route in
                homeRouter.push(route)
            }
            
            if viewModel.showPopup {

                Color.black.opacity(0.4)
                    .ignoresSafeArea()

                TwoButtonPopupView(
                    title: "Send Message",
                    message: "Are you sure you want to send this message?",
                    primaryButtonTitle: "Send",
                    secondaryButtonTitle: "Cancel"
                ) {

                    print("Send")

                    viewModel.showPopup = false

                } onSecondaryTap: {

                    print("Cancel")

                    viewModel.showPopup = false
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
