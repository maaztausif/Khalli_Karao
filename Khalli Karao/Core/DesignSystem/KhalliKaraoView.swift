//
//  KhalliKaraoView.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 02.06.26.
//


import SwiftUI
import Combine

struct KhalliKaraoView: View {

    let size: CGFloat

    var body: some View {

        ZStack {

            Circle()
                .fill(Color(hex: "#ECBB40"))
                .frame(width: size, height: size)

            Text("KHALLI\nKARAO!")
                .font(.system(size: 20, weight: .black))
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    KhalliKaraoView(size:200)
}
