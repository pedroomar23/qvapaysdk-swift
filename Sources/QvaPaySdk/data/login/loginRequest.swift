//
//  loginRequest.swift
//  QvaPaySdk
//
//  Created by Pedro Omar  on 1/15/26.
//

import Foundation

public struct LoginModel : Decodable, Hashable, Encodable, Sendable {
    public var email : String
    public var password : String
    public var two_factor_code : String
    public var remember : Bool
    
    enum CodingKeys : String, CodingKey {
        case email, password, two_factor_code
        case remember
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decode(String.self, forKey: .email)
        self.password = try container.decode(String.self, forKey: .password)
        self.two_factor_code = try container.decode(String.self, forKey: .two_factor_code)
        self.remember = try container.decode(Bool.self, forKey: .remember)
    }
    
    public init(email: String, password: String, two_factor_code: String, remember: Bool) {
        self.email = email
        self.password = password
        self.two_factor_code = two_factor_code
        self.remember = remember
    }
}
