//
//  ErrorModel.swift
//  NetworkLayer
//
//  Created by Celal Tok on 5.12.2020.
//

import Foundation

class ErrorModel: Error {
    
    // MARK: - Properties
    var messageKey: String
    var message: String {
        return messageKey.localized()
    }
    
    init(_ messageKey: String) {
        self.messageKey = messageKey
    }
}

// MARK: - Public Functions
extension ErrorModel {
    
    class func generalError() -> ErrorModel {
        return ErrorModel(ErrorKey.general.rawValue)
    }
}
