//
//  RequestService.swift
//  Readly
//
//  Created by Viorel Rinja on 4/24/21.
//

//import Foundation
import Alamofire
import RxSwift

class RequestService {
    static func getRequest<T: Codable>(
        to url: String,
        with parameters: Parameters! = [:],
        method: HTTPMethod,
        headers: HTTPHeaders? = nil
    ) -> Observable<T> {
        
        return Observable.create { observer in
            let request = AF.request(url,
                                     method: method,
                                     parameters: parameters,
                                     encoding: URLEncoding.queryString,
                                     headers: headers)
            .validate().responseDecodable { (response: DataResponse<T, AFError>)  in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(Exception.HTTP(error: error, data: response.data))
                    }
            }
            request.resume()
            
            return Disposables.create { request.cancel() }
        }.subscribe(on: ConcurrentDispatchQueueScheduler(qos: .utility))
    }
}

