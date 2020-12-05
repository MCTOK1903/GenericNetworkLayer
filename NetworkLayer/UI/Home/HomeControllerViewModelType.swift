//
//  HomeControllerViewModelType.swift
//  NetworkLayer
//
//  Created by Celal Tok on 5.12.2020.
//

import Foundation

protocol HomeControllerViewModelType {
    var delegate: HomeControllerViewModelDelegate? { get set }
    func load()
}

enum HomeControllerViewModelOutput {
    case updatetitle(String)
    case showMovieList([MovieResponseModel])
}

protocol HomeControllerViewModelDelegate: class {
    func handleViewModelOutput(_ output: HomeControllerViewModelOutput)
}
