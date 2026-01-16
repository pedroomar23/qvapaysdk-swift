import XCTest
@testable import QvaPaySdk

final class QvaPaySdkTests : XCTestCase {
    
    // MARK: - Login Request
    
    func testLoginRequest() async throws {
        let jsonString = """
            {
                "email": "amazon@qvapay.com",
                "password": "2890367rg20op3ryg",
                "two_factor_code": "1234",
                "remember": true
            }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let loginJSON = try decoder.decode(LoginModel.self, from: jsonData)
        print("✅ DEBUG: JSON RESPONSE \(loginJSON)")
        
        XCTAssertEqual(loginJSON.email, "amazon@qvapay.com")
        XCTAssertEqual(loginJSON.password, "2890367rg20op3ryg")
        XCTAssertEqual(loginJSON.two_factor_code, "1234")
        XCTAssertEqual(loginJSON.remember, true)
    }
    
    // MARK: - Login Response
    
    func testLoginResponse() async throws {
        let jsonString = """
            {
              "accessToken": "1|$2b$10$QzRetQodABPVePrtMx95P.136c1/R08yzL07oMGL6o.pYs6anq.H6",
              "token_type": "Bearer",
              "me": {
                "uuid": "12b1e145-82ce-480a-b5c6-1a681a125f0a",
                "username": "skymind",
                "name": "SkyMind",
                "lastname": "Payments",
                "email": "ceo@skymind.ltd",
                "bio": "Soluciones Fintech a la medida.\nRevolucionando pagos online.",
                "address": "",
                "image": "profiles/OJuH8oHuab0F2eNqdgpmux6VtJWBiN15BABOaUtD.png",
                "cover": "covers/0JIMAjJIhX0A9O8bwgg77qXMhi87eRWAbp8UqQNj.jpg",
                "balance": "90.59",
                "pending_balance": "0",
                "satoshis": 2424,
                "createdAt": "2024-01-28T23:24:54.000Z",
                "updatedAt": "2025-07-19T16:49:01.000Z",
                "phone": "+17867918868",
                "phone_verified": true,
                "telegram": "",
                "twitter": null,
                "kyc": true,
                "vip": true,
                "golden_check": false,
                "pin": 1111,
                "last_seen": "2025-07-19T16:49:01.000Z",
                "telegram_id": "7427512552",
                "role": "admin",
                "p2p_enabled": true
              }
            }
        """
    }
}
