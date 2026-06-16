//
//  APIEndpoint.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 17.06.26.
//

import SwiftUI
import Foundation

protocol APIEndpoint {
    
    var path: String { get }
    var method: HTTPMethod { get }
}
