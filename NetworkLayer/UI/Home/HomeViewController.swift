//
//  HomeViewController.swift
//  NetworkLayer
//
//  Created by Celal Tok on 5.12.2020.
//

import UIKit

class HomeViewController: UIViewController {
    
    //Mark: Properties
    
    var viewModel: HomeControllerViewModelType! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private var movieList: [MovieResponseModel] = []
    
    //Mark:LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.load()
    }
}

extension HomeViewController: HomeControllerViewModelDelegate {
    func handleViewModelOutput(_ output: HomeControllerViewModelOutput) {
        switch output {
        case .updatetitle(let title):
            self.title = title
        case .showMovieList(let movies):
            self.movieList = movies
            for movie in movieList {
                print(movie.title)
            }
            //Reload Data
        }
    }
}
