//
//  UpdateViewModel.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 09.06.26.
//

import SwiftUI
import Combine

final class UpdateProfileViewModel:ObservableObject{
    @Published var txtName:String = ""
    @Published var dob:String = ""
}
