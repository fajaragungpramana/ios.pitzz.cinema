//
//  FilmViewModel.swift
//  Pitzz
//
//  Created by Mobile Engineer on 29/08/22.
//

import Foundation
import RxSwift

class FilmViewModel : NSObject {
    
    private let mDisposeBag = DisposeBag()
    
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
    
    func getDiscoverMovie() {
        let params = [
            "api_key" : "fb21962d64137d532e7458faabe087bb"
        ]
        mFilmRepository.discoverMovie(parameters: params)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { data in
                self.mFilmData = data.results
            }, onError: { error in
                switch error {
                case AppResult.unauthorized:
                    print("DiscoverMovie : Unauthorized.")
                case AppResult.internalServerError:
                    print("DiscoverMovie : Internal Server Error.")
                default:
                    print("Unknown error:", error)
                }
            })
            .disposed(by: self.mDisposeBag)
    }
    
}
