//
//  RequestService.swift
//  Readly
//
//  Created by maughray on 4/17/21.
//

import Foundation
import Alamofire
import ObjectMapper

class RequestService {
    
    typealias RequestResultCompletion = ((Data?, Int?) -> Void)?
    typealias RequestServiceResult<T: BaseMappable> = (([T]?) -> Void)?
    
    static func retrieveData(_ url: String, completion: RequestResultCompletion) {
        AF.request(url,
                   method: .get)
            .validate()
            .response { (response) in
                
                let statusCode = response.response?.statusCode
                completion?(response.data, statusCode)
            }
    }
    
    static func retrieveData<T: BaseMappable>(_ url: String, resultType: T.Type, completion: RequestServiceResult<T>)
    {
        AF.request(url,
                   method: .get)
            .validate()
            .responseJSON { (response: AFDataResponse<Any>) in
                
                switch response.result
                {
                case .success(let json):
                    completion?(Mapper<T>().mapArray(JSONObject: json))
                default:
                    completion?(nil)
                }
            }
    }
}

