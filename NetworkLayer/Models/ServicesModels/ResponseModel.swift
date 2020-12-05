//
//  ResponseModel.swift
//  NetworkLayer
//
//  Created by Celal Tok on 5.12.2020.
//

import Foundation

struct ResponseModel<T: Codable>: Codable {
    
    var statusMessage: String?
    var statusCode: Int?
    var results: T?
    var rawData: Data?
    var json: String? {
        guard let rawData = rawData else { return nil }
        return String(data: rawData, encoding: String.Encoding.utf8)
    }
    
    var request: RequestModel?
    
    public init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        results = try? keyedContainer.decode(T.self, forKey: CodingKeys.results)
        statusMessage = try? keyedContainer.decode(String.self, forKey: CodingKeys.statusMessage)
        statusCode = try? keyedContainer.decode(Int.self, forKey: CodingKeys.statusCode)
    }
}

extension ResponseModel {
    private enum  CodingKeys: String, CodingKey {
        case results
        case statusMessage = "status_message"
        case statusCode = "status_code"
    }
}
