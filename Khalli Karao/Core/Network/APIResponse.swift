//
//  APIResponse.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 17.06.26.
//

import SwiftUI

struct APIResponse<T: Codable>: Codable {
    
    let success: Bool
    let message: String
    let data: T?
}
