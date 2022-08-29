//
//  FilmService.swift
//  Pitzz
//
//  Created by Mobile Engineer on 29/08/22.
//

import Alamofire

class FilmService {
    
    func discoverMovie(parameters: Parameters) -> DataRequest {
        return AF.request(AppRoute.discoverMovie(params: parameters))
    }
    
}
