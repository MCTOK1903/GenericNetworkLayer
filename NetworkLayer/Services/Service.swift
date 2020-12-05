//
//  Service.swift
//  NetworkLayer
//
//  Created by Celal Tok on 5.12.2020.
//

import Foundation

public protocol ServiceProtocol {
    func movie(completion: @escaping(Swift.Result<[MovieResponseModel], ErrorModel>) -> Void)
}

public class Service: ServiceProtocol {
    ///Fetch Movie
    
    public init() {}
    
    public func movie(completion: @escaping(Swift.Result<[MovieResponseModel], ErrorModel>) -> Void) {
        ServiceMenager.shared.sendRequest(request: MovieRequestModel()) { (result) in
            completion(result)
        }
    }
}
