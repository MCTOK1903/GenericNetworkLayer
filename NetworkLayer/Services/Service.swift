//
//  Service.swift
//  NetworkLayer
//
//  Created by Celal Tok on 5.12.2020.
//

import Foundation

class Service {
    class func movie(completion: @escaping(Swift.Result<[MovieResponseModel], ErrorModel>) -> Void) {
        ServiceMenager.shared.sendRequest(request: MovieRequestModel()) { (result) in
            completion(result)
        }
    }
}
