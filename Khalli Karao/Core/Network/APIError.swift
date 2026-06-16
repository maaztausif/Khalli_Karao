//
//  APIError.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 17.06.26.
//
import SwiftUI

enum APIError: Error {
    
    case invalidURL
    case invalidResponse
    case decodingError
    case unauthorized
    case serverError
    case unknown
}
