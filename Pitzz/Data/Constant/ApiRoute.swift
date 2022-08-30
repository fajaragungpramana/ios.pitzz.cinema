//
//  AppRoute.swift
//  Pitzz
//
//  Created by Mobile Engineer on 29/08/22.
//

import Foundation
import Alamofire

enum ApiRoute: URLRequestConvertible {
    
    case discoverMovie(params: Parameters?)
    
    var method: HTTPMethod {
        switch self {
        case .discoverMovie:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .discoverMovie:
            return "discover/movie"
        }
    }
        
    var parameter: Parameters? {
        switch self {
        case .discoverMovie(let params):
            return params
        }
    }
        
    func asURLRequest() throws -> URLRequest {
        let url = try Constant.URL_GATEWAY.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameter)
    }
    
}
