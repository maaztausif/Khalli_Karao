//
//  PatreonBottomSheetViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 04.06.26.
//

import SwiftUI
import Combine

final class PatreonBottomSheetViewModel:ObservableObject{
    @Published var shouldDissmiss:Bool = false
    @Published var destination:AuthRoute?
    
    func done(){
        self.shouldDissmiss = true
    }
    func connectToPatreon(){
        destination = .connectToPatreon
    }
}
