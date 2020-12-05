//
//  HomeControllerViewModel.swift
//  NetworkLayer
//
//  Created by Celal Tok on 5.12.2020.
//

import Foundation

final class HomeControllerViewModel: HomeControllerViewModelType {
    
    //Mark: Properties
    
    var delegate: HomeControllerViewModelDelegate?
    private let service: ServiceProtocol
    private var movies: [MovieResponseModel] = []
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func load() {
        notify(.updatetitle("Movies"))
        
        service.movie { [weak self] (result) in
            
            guard let self = self else { return }
            
            switch result {
            case Result.success(let response):
                self.movies = response
                self.notify(.showMovieList(self.movies))
            case Result.failure(let error):
                print(error)
            }
        }
    }
    
    private func notify(_ output: HomeControllerViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
