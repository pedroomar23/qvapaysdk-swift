//
//  register.swift
//  QvaPaySdk
//
//  Created by Pedro Omar  on 1/15/26.
//

import Foundation

public struct RegisterRequest : Decodable, Hashable, Encodable, Sendable {
    public var name : String
    public var email : String
    public var password : String
    public var c_password : String
    public var invite : String
    
    enum CodingKeys : String, CodingKey {
        case name, email, password
        case c_password
        case invite
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.email = try container.decode(String.self, forKey: .email)
        self.password = try container.decode(String.self, forKey: .password)
        self.c_password = try container.decode(String.self, forKey: .c_password)
        self.invite = try container.decode(String.self, forKey: .invite)
    }
    
    public init(name: String, email: String, password: String, c_password: String, invite: String) {
        self.name = name
        self.email = email
        self.password = password
        self.c_password = c_password
        self.invite = invite
    }
}

public struct RegisterResponse : Decodable, Hashable, Encodable, Sendable {
    public let message : String
    public let accessToken : String
    
    enum CodingKeys : String, CodingKey {
        case message = "message"
        case accessToken = "accessToken"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
        self.accessToken = try container.decode(String.self, forKey: .accessToken)
    }
    
    public init(message: String, accessToken: String) {
        self.message = message
        self.accessToken = accessToken
    }
}
