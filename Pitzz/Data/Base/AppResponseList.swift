//
//  AppResponseList.swift
//  Pitzz
//
//  Created by Mobile Engineer on 29/08/22.
//

import Foundation

struct AppResponseList<T : Codable> : Codable {
    var results: [T]? = nil
    
    enum CodingKeys : String, CodingKey {
        case results = "results"
    }
}
