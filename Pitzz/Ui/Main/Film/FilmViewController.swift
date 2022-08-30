//
//  FilmViewController.swift
//  Pitzz
//
//  Created by Mobile Engineer on 29/08/22.
//

import Foundation
import UIKit

class FilmViewController : UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let tableViewData = Array(repeating: "Item", count: 5)
    
    private var mFilmViewModel: FilmViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mFilmViewModel = FilmViewModel(filmRepository: FilmRepository(filmService: FilmService(apiClient: ApiClient())))
        self.mFilmViewModel.bindFilmViewModelToController = {
            self.tableView.dataSource = self
        }
        
        self.mFilmViewModel.getDiscoverMovie()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mFilmViewModel.mFilmData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = self.mFilmViewModel.mFilmData[indexPath.row].originalTitle
        
        return cell
    }
    
}
