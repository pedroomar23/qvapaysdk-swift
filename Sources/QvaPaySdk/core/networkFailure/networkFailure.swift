//
//  File.swift
//  QvaPaySdk
//
//  Created by Pedro Omar  on 1/15/26.
//

import Foundation

public enum NetworkError : Error {
    case jsonFailure(message: String)
    case statusCodeFailure(statusCode: Int)
}
