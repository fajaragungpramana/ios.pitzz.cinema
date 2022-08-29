//
//  AppRoute.swift
//  Pitzz
//
//  Created by Mobile Engineer on 29/08/22.
//

import Foundation
import Alamofire

enum AppRoute: URLRequestConvertible {
case discoverMovie(params: Parameters)
    
    var gateway: URL? {
        return URL(string: "https://api.themoviedb.org/3/")
    }
    
    var method: HTTPMethod {
        switch self {
        case .discoverMovie: return .get
        }
    }
    
    var path: String {
        switch self {
        case .discoverMovie: return "discover/movie"
        }
    }
    
    var parameter: Parameters {
        switch self {
        case let .discoverMovie(params: params):
            return params
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let urlString = gateway?.appendingPathComponent(path).absoluteString.removingPercentEncoding!
        let removeSpace = urlString?.replacingOccurrences(of: " ", with: "")
        let url = URL(string: removeSpace!)
        var request = URLRequest(url: url!)
        request.method = method
        if (method == .get) {
            let encode = try URLEncodedFormParameterEncoder(destination: .methodDependent)
            request = encode.encode(parameter, into: JSONEncoding.default.encode(request))
        } else {
            request = try JSONParameterEncoder().encode(parameter, into: request)
            request.setValue("application/json", forHTTPHeaderField: "Accept")
        }
        
        return request
    }
}
