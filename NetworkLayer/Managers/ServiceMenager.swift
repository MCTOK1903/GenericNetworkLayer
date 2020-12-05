//
//  ServiceMenager.swift
//  NetworkLayer
//
//  Created by Celal Tok on 5.12.2020.
//

import Foundation

class ServiceMenager {
    
    //Mark: Properties
    public static let shared: ServiceMenager = ServiceMenager()
}

// Mark: - Service

extension ServiceMenager {
    
    func sendRequest<T:Codable>(request: RequestModel, completion: @escaping(Swift.Result<T,ErrorModel>) -> Void) {
        if request.isLoggingEnabled.0 {
            print(request)
        }
        
        URLSession.shared.dataTask(with: request.urlRequest()) { (data, response, error) in
            guard let data = data, var responseModel = try? JSONDecoder().decode(ResponseModel<T>.self, from: data) else {
                let error: ErrorModel = ErrorModel(ErrorKey.parsing.rawValue)
                completion(Result.failure(error))
                return
            }
            
            responseModel.rawData = data
            responseModel.request = request
            
            if request.isLoggingEnabled.1 {
                print(responseModel)
            }
            
            if let data = responseModel.results {
                completion(Result.success(data))
            } else {
                completion(Result.failure(ErrorModel.generalError()))
            }
            
        }.resume()
    }
}
