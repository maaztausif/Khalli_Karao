//
//  DropDownView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 06.06.26.
//

import SwiftUI

struct DropdownView: View {

    let options: [String]

    @Binding var selectedOption: String

    var body: some View {

       VStack {
            Menu {

                ForEach(options, id: \.self) { option in

                    Button(option) {
                        selectedOption = option
                    }
                }

            } label: {

                HStack {
                    Image("Icon_Patreon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Text(selectedOption)
                        .foregroundStyle(.black)
                        .font(.system(size: 20,weight: .bold))

                    Spacer()

                    Image(systemName: "arrow.down")
                        .foregroundStyle(.black)
                    
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(12)
            }
//            .padding()
           
        }
    }
}

#Preview {
    @State var selection = "1"
    return DropdownView(options: ["1"], selectedOption: $selection)
}
