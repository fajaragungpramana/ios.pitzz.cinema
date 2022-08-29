//
//  File.swift
//  Pitzz
//
//  Created by Mobile Engineer on 29/08/22.
//

import Foundation

struct Film : Decodable {
    var id: Int? = nil
    var posterPath: String? = nil
    var originalTitle: String? = nil
    
    enum CodingKeys : String, CodingKey {
        case id
        case posterPath = "poster_path"
        case originalTitle = "original_title"
    }
}
