//
//  ErrorModel.swift
//  NetworkLayer
//
//  Created by Celal Tok on 5.12.2020.
//

import Foundation

public class ErrorModel: Error {
    
    // MARK: Properties
    var messageKey: String
    var message: String {
        return messageKey.localized()
    }
    
    // Mark: init
    init(_ messageKey: String) {
        self.messageKey = messageKey
    }
}

// MARK: - Public func
extension ErrorModel {
    
    class func generalError() -> ErrorModel {
        return ErrorModel(ErrorKey.general.rawValue)
    }
}
