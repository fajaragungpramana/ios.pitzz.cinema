//
//  ApiClient.swift
//  Pitzz
//
//  Created by Mobile Engineer on 30/08/22.
//

import Foundation
import RxSwift
import Alamofire

class ApiClient {
    
     func request<T : Codable>(_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = AF.request(urlConvertible).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    switch response.response?.statusCode {
                    case 401:
                        observer.onError(AppResult.unauthorized)
                    case 500:
                        observer.onError(AppResult.internalServerError)
                    default:
                        observer.onError(error)
                    }
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
}
