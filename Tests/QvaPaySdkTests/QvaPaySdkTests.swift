import XCTest
@testable import QvaPaySdk

final class QvaPaySdkTests : XCTestCase {
    
    // MARK: - TEST Login Request
    
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
    
    // MARK: - TEST Login Request Pin
    
    func testRequestPin() async throws {
        let jsonString = """
            {
                "email": "amazon@qvapay.com",
                "password": "2890367rg20op3ryg"
            }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let requestJSON = try decoder.decode(RequestPin.self, from: jsonData)
        print("✅ DEBUG: JSON RESPONSE \(requestJSON)")
        
        XCTAssertEqual(requestJSON.email, "amazon@qvapay.com")
        XCTAssertEqual(requestJSON.password, "2890367rg20op3ryg")
    }
    
    // MARK: - TEST Login Response
    
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
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let responseJSON = try decoder.decode(LoginResponse.self, from: jsonData)
        print("✅ DEBUG: JSON RESPONSE \(responseJSON)")
        
        XCTAssertEqual(responseJSON.accessToken, "1|$2b$10$QzRetQodABPVePrtMx95P.136c1/R08yzL07oMGL6o.pYs6anq.H6")
        XCTAssertEqual(responseJSON.token_type, "Bearer")
        XCTAssertEqual(responseJSON.me.uuid, "12b1e145-82ce-480a-b5c6-1a681a125f0a")
        XCTAssertEqual(responseJSON.me.username, "skymind")
        XCTAssertEqual(responseJSON.me.lastname, "Payments")
        XCTAssertEqual(responseJSON.me.email, "ceo@skymind.ltd")
        XCTAssertEqual(responseJSON.me.bio, "Soluciones Fintech a la medida.\nRevolucionando pagos online.")
        XCTAssertEqual(responseJSON.me.image, "profiles/OJuH8oHuab0F2eNqdgpmux6VtJWBiN15BABOaUtD.png")
        XCTAssertEqual(responseJSON.me.cover, "covers/0JIMAjJIhX0A9O8bwgg77qXMhi87eRWAbp8UqQNj.jpg")
        XCTAssertEqual(responseJSON.me.balance, "90.59")
        XCTAssertEqual(responseJSON.me.pending_balance, "0")
        XCTAssertEqual(responseJSON.me.satochis, 2424)
        XCTAssertEqual(responseJSON.me.createdAt, "2024-01-28T23:24:54.000Z")
        XCTAssertEqual(responseJSON.me.updatedAt, "2025-07-19T16:49:01.000Z")
        XCTAssertEqual(responseJSON.me.phone, "+17867918868")
        XCTAssertEqual(responseJSON.me.phone_verified, true)
        XCTAssertEqual(responseJSON.me.telegram, "")
        XCTAssertEqual(responseJSON.me.twitter, nil)
        XCTAssertEqual(responseJSON.me.kyc, true)
        XCTAssertEqual(responseJSON.me.vip, true)
        XCTAssertEqual(responseJSON.me.golden_check, false)
        XCTAssertEqual(responseJSON.me.pin, 1111)
        XCTAssertEqual(responseJSON.me.last_seen, "2025-07-19T16:49:01.000Z")
        XCTAssertEqual(responseJSON.me.role, "admin")
        XCTAssertEqual(responseJSON.me.p2p_enabled, true)
    }
    
    // MARK: - TEST Register Request
    
    func testRegister() async throws {
        let jsonString = """
            {
                "name": "Juan Perez",
                "email": "juan@gmail.com",
                "password": "CffasdKB73iTtzNJN",
                "c_password": "CffasdKB73iTtzNJN",
                "invite": "referer_username (OPTIONAL)"
            }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let registerJSON = try decoder.decode(RegisterRequest.self, from: jsonData)
        print("✅ DEBUG: JSON REQUEST \(registerJSON)")
        
        XCTAssertEqual(registerJSON.name, "Juan Perez")
        XCTAssertEqual(registerJSON.email, "juan@gmail.com")
        XCTAssertEqual(registerJSON.password, "CffasdKB73iTtzNJN")
        XCTAssertEqual(registerJSON.c_password, "CffasdKB73iTtzNJN")
        XCTAssertEqual(registerJSON.invite, "referer_username (OPTIONAL)")
    }
    
    // MARK: - TEST Register Response
    
    func testRegisterResponse() async throws {
        let jsonString = """
            {
              "message": "¡Bienvenido a QvaPay Juan Perez!",
              "accessToken": "17|pnKrh9BbjwgsnHrEumugIcJ3WK19hsD844dzxgbJ"
            }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let registerResponse = try decoder.decode(RegisterResponse.self, from: jsonData)
        print("✅ DEBUG: JSON RESPONSE \(registerResponse)")
        
        XCTAssertEqual(registerResponse.message, "¡Bienvenido a QvaPay Juan Perez!")
        XCTAssertEqual(registerResponse.accessToken, "17|pnKrh9BbjwgsnHrEumugIcJ3WK19hsD844dzxgbJ")
    }
}
