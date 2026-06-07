//
//  test.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 07.06.26.
//

import SwiftUI
import Combine
struct TestView: View {

    @State private var text = ""

    var body: some View {

        TextEditor(text: $text)
            .border(.red)
            .frame(height: 200)
    }
}

