//
//  enums.swift
//  Khalli Karao
//
//  Created by Maaz Bin Tausif on 13.06.26.
//

enum PopupType {
    case success
    case error
    case Empty
}

enum PopupMessage {

    case success(String)
    case error(String)
    case empty(String)

    var title: String {

        switch self {

        case .success:
            return "Success"

        case .error:
            return "Error"
        case .empty:
            return "Empty TextField"
        }
    }

    var message: String {

        switch self {
        case .success(let message):
            return message
        case .error(let message):
            return message
        case .empty(let message):
            return message
        }
    }
}
