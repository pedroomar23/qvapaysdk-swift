//
//  requestPin.swift
//  QvaPaySdk
//
//  Created by Pedro Omar  on 1/15/26.
//

import Foundation

public struct RequestPin : Decodable, Hashable, Encodable, Sendable {
    public var email : String
    public var password : String
    
    enum CodingKeys : String, CodingKey {
        case email, password
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decode(String.self, forKey: .email)
        self.password = try container.decode(String.self, forKey: .password)
    }
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
