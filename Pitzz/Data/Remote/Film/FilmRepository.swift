//
//  FilmRepository.swift
//  Pitzz
//
//  Created by Mobile Engineer on 29/08/22.
//

import Foundation
import Alamofire

class FilmRepository {
    
    private var mFilmService: FilmService
    
    init(filmService: FilmService) {
        self.mFilmService = filmService
    }
    
    func discoverMovie(parameters: Parameters, completion: @escaping (AppResponseList<Film>?) -> ()) {
        mFilmService.discoverMovie(parameters: parameters).responseDecodable(of: AppResponseList<Film>.self) { response in
            guard let results = response.value else {
                return completion(nil)
            }
            completion(results)
        }
    }
    
}
