//
//  endpointUrl.swift
//  QvaPaySdk
//
//  Created by Pedro Omar  on 1/15/26.
//

import Foundation

public enum EndpointUrl {
    private static let urlString = "https://api.qvapay.com"
    
    case login
    case requestPin
    case register
    
    var path : String {
        switch self {
        case .login: return "/auth/login"
        case .requestPin: return "/auth/request-pin"
        case .register: return "/auth/register"
        }
    }
    
    var url : URL {
        return URL(string: EndpointUrl.urlString + path)!
    }
}
