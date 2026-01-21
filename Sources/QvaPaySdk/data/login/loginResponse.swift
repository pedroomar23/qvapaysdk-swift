//
//  File.swift
//  QvaPaySdk
//
//  Created by Pedro Omar  on 1/15/26.
//

import Foundation

public struct LoginResponse : Decodable, Hashable, Encodable, Sendable {
    public let accessToken : String
    public let token_type : String
    public let me : ME
    
    enum CodingKeys : String, CodingKey {
        case accessToken = "accessToken"
        case token_type = "token_type"
        case me = "me"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessToken = try container.decode(String.self, forKey: .accessToken)
        self.token_type = try container.decode(String.self, forKey: .token_type)
        self.me = try container.decode(ME.self, forKey: .me)
    }
    
    public init(accessToken: String, token_type: String, me: ME) {
        self.accessToken = accessToken
        self.token_type = token_type
        self.me = me
    }
}

public struct ME : Decodable, Hashable, Encodable, Sendable {
    public let uuid : String
    public let username : String
    public let name : String
    public let lastname : String
    public let email : String
    public let bio : String
    public let address : String
    public let image : String
    public let cover : String
    public let balance : String
    public let pending_balance : String
    public let satochis : Int
    public let createdAt : String
    public let updatedAt : String
    public let phone : String
    public let phone_verified : Bool
    public let telegram : String
    public let twitter : String?
    public let kyc : Bool
    public let vip : Bool
    public let golden_check : Bool
    public let pin : Int
    public let last_seen : String
    public let telegram_id : String
    public let role : String
    public let p2p_enabled : Bool
    
    enum CodingKeys : String, CodingKey {
        case uuid = "uuid"
        case username = "username"
        case name = "name"
        case lastname = "lastname"
        case email = "email"
        case bio = "bio"
        case address = "address"
        case image = "image"
        case cover = "cover"
        case balance = "balance"
        case pending_balance = "pending_balance"
        case satochis = "satochis"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case phone = "phone"
        case phone_verified = "phone_verified"
        case telegram = "telegram"
        case twitter = "twitter"
        case kyc = "kyc"
        case vip = "vip"
        case golden_check = "golden_check"
        case pin = "pin"
        case last_seen = "last_seen"
        case telegram_id = "telegram_id"
        case role = "role"
        case p2p_enabled = "p2p_enabled"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uuid = try container.decode(String.self, forKey: .uuid)
        self.username = try container.decode(String.self, forKey: .username)
        self.name = try container.decode(String.self, forKey: .name)
        self.lastname = try container.decode(String.self, forKey: .lastname)
        self.email = try container.decode(String.self, forKey: .email)
        self.bio = try container.decode(String.self, forKey: .bio)
        self.address = try container.decode(String.self, forKey: .address)
        self.image = try container.decode(String.self, forKey: .image)
        self.cover = try container.decode(String.self, forKey: .cover)
        self.balance = try container.decode(String.self, forKey: .balance)
        self.pending_balance = try container.decode(String.self, forKey: .pending_balance)
        self.satochis = try container.decode(Int.self, forKey: .satochis)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.phone_verified = try container.decode(Bool.self, forKey: .phone_verified)
        self.telegram = try container.decode(String.self, forKey: .telegram)
        self.twitter = try container.decodeIfPresent(String.self, forKey: .twitter) ?? ""
        self.kyc = try container.decode(Bool.self, forKey: .kyc)
        self.vip = try container.decode(Bool.self, forKey: .vip)
        self.golden_check = try container.decode(Bool.self, forKey: .golden_check)
        self.pin = try container.decode(Int.self, forKey: .pin)
        self.last_seen = try container.decode(String.self, forKey: .last_seen)
        self.telegram_id = try container.decode(String.self, forKey: .telegram_id)
        self.role = try container.decode(String.self, forKey: .role)
        self.p2p_enabled = try container.decode(Bool.self, forKey: .p2p_enabled)
    }
    
    public init(uuid: String, username: String, name: String, lastname: String, email: String, bio: String, address: String, image: String, cover: String, balance: String, pending_balance: String, satochis: Int, createdAt: String, updatedAt: String, phone: String, phone_verified: Bool, telegram: String, twitter: String?, kyc: Bool, vip: Bool, golden_check: Bool, pin: Int, last_seen: String, telegram_id: String, role: String, p2p_enabled: Bool) {
        self.uuid = uuid
        self.username = username
        self.name = name
        self.lastname = lastname
        self.email = email
        self.bio = bio
        self.address = address
        self.image = image
        self.cover = cover
        self.balance = balance
        self.pending_balance = pending_balance
        self.satochis = satochis
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.phone = phone
        self.phone_verified = phone_verified
        self.telegram = telegram
        self.twitter = twitter
        self.kyc = kyc
        self.vip = vip
        self.golden_check = golden_check
        self.pin = pin
        self.last_seen = last_seen
        self.telegram_id = telegram_id
        self.role = role
        self.p2p_enabled = p2p_enabled
    }
}
