//
//  RequestService.swift
//  Readly
//
//  Created by Viorel Rinja on 4/24/21.
//


import Foundation
import Alamofire
import ObjectMapper

class RequestService {
    
    typealias RequestResultCompletion = ((Data?, Int?) -> Void)?
    
    static func retrieveData(_ url: String, completion: RequestResultCompletion) {
        AF.request(url,
                   method: .get)
            .validate()
            .response { (response) in
                
                let statusCode = response.response?.statusCode
                completion?(response.data, statusCode)
            }
    }
}

