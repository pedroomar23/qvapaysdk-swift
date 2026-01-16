//
//  requestPin.swift
//  QvaPaySdk
//
//  Created by Pedro Omar  on 1/15/26.
//

import Foundation

public struct RequestPin : Decodable, Hashable, Encodable, Sendable {
    public var username : String
    public var password : String
    
    enum CodingKeys : String, CodingKey {
        case username, password
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.username = try container.decode(String.self, forKey: .username)
        self.password = try container.decode(String.self, forKey: .password)
    }
    
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
