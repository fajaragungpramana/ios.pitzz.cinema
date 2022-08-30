//
//  FilmService.swift
//  Pitzz
//
//  Created by Mobile Engineer on 29/08/22.
//

import Alamofire
import RxSwift

class FilmService {
    
    private var mApiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.mApiClient = apiClient
    }
    
    func discoverMovie(parameters: Parameters?) -> Observable<AppResponseList<Film>> {
        return mApiClient.request(ApiRoute.discoverMovie(params: parameters))
    }
    
}
