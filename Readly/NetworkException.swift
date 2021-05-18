//
//  NetworkException.swift
//  Readly
//
//  Created by Viorel Rinja on 5/16/21.
//

import Foundation

enum Exception: Error {
    case NetworkConnection
    case HTTP(error: Error, data: Data?)
    
    var message: String {
        switch self {
        case .NetworkConnection:
            return "Network connection error. No internet"
        case .HTTP(let error, _):
            return error.localizedDescription
        }
    }
}

struct APIError: Codable {
    let cod: String?
    let message: String
    var description: String {
        get {
            guard let errorCode = cod else { return message }
            return message + "\n" + errorCode
        }
    }
}
