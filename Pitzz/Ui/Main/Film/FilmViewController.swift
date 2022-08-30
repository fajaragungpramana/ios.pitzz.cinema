//
//  FilmViewController.swift
//  Pitzz
//
//  Created by Mobile Engineer on 29/08/22.
//

import Foundation
import UIKit

class FilmViewController : UIViewController {
    
    private var mFilmViewModel: FilmViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mFilmViewModel = FilmViewModel(filmRepository: FilmRepository(filmService: FilmService(apiClient: ApiClient())))
        self.mFilmViewModel.bindFilmViewModelToController = {
            
        }
        
        self.mFilmViewModel.getDiscoverMovie()
    }
    
}
