//
//  MovieRequestModel.swift
//  NetworkLayer
//
//  Created by Celal Tok on 5.12.2020.
//

import Foundation

class MovieRequestModel: RequestModel {
    override var path: String {
        return Constant.NetworkConstant.moviePath
    }
    
    override var parameters: [String : Any?] {
        return [
            "api_key": Constant.NetworkConstant.APIKey
        ]
    }
}
