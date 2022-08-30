//
//  FilmRepository.swift
//  Pitzz
//
//  Created by Mobile Engineer on 29/08/22.
//

import Foundation
import Alamofire
import RxSwift

class FilmRepository {
    
    private var mFilmService: FilmService
    
    init(filmService: FilmService) {
        self.mFilmService = filmService
    }
    
    func discoverMovie(parameters: Parameters?) -> Observable<AppResponseList<Film>> {
        return mFilmService.discoverMovie(parameters: parameters)
    }
    
}
