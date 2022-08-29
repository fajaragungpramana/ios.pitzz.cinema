//
//  FilmViewModel.swift
//  Pitzz
//
//  Created by Mobile Engineer on 29/08/22.
//

import Foundation

class FilmViewModel : NSObject {
    
    private var mFilmRepository: FilmRepository
    
    init(filmRepository: FilmRepository) {
        self.mFilmRepository = filmRepository
    }
    
    private(set) var mFilmData: [Film]! {
        didSet {
            self.bindFilmViewModelToController()
        }
    }
    
    var bindFilmViewModelToController : (() -> ()) = {}
    
    func getDiscoverFilm() {
        let params = [
            "api_key" : "fb21962d64137d532e7458faabe087bb"
        ]
        self.mFilmRepository.discoverMovie(parameters: params, completion: { (data) in
            self.mFilmData = data?.results
        })
    }
    
}
