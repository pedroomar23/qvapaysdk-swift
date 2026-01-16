//
//  File.swift
//  QvaPaySdk
//
//  Created by Pedro Omar  on 1/15/26.
//

import Foundation
import os.log

@available(macOS 11, iOS 15, *)
public class RegisterApi : @unchecked Sendable {
    public static let shared = RegisterApi()
    let logger = Logger()
    let session : URLSession = {
        let delegate = SessionDelegate.shared
        let configuration = URLSessionConfiguration.default
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        configuration.timeoutIntervalForRequest = 10
        return URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
    }()
    
    // MARK: - Register
    
    public func register(name: String, email: String, password: String, c_password: String, invite: String, completion: @escaping (Result<RegisterResponse, NetworkError>) -> Void) async {
        let decoder = JSONDecoder()
        let requestURL = EndpointUrl.register.url
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        request.timeoutInterval = 10
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        logger.info("✅ DEBUG: Iniciando Solicitud a POST \(requestURL.absoluteString)")
        
        let register = RegisterRequest(
            name: name,
            email: email,
            password: password,
            c_password: c_password,
            invite: invite
        )
        
        do {
            let jsonBody = try? JSONEncoder().encode(register)
            request.httpBody = jsonBody
            
            let (data, response) = try await session.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                logger.info("✅ DEBUG: SERVER RESPONSE \(httpResponse.statusCode)")
                
                if let jsonData = String(data: data, encoding: .utf8) {
                    logger.debug("✅ DEBUG: SERVER RESPONSE \(jsonData)")
                } else {
                    logger.error("❌ DEBUG: SERVER FAILURE RESPONSE")
                }
                
                switch httpResponse.statusCode {
                case 200:
                    let registerJSON = try decoder.decode(RegisterResponse.self, from: data)
                    print("✅ DEBUG: JSON RESPONSE \(registerJSON)")
                    completion(.success(registerJSON))
                case 400:
                    print("❌ DEBUG: SERVER FAILURE RESPONSE \(NetworkError.statusCodeFailure(statusCode: httpResponse.statusCode))")
                default:
                    completion(.failure(NetworkError.statusCodeFailure(statusCode: httpResponse.statusCode)))
                }
            }
        } catch {
            completion(.failure(NetworkError.jsonFailure(message: "❌ DEBUG: JSON FAILURE RESPONSE \(error.localizedDescription)")))
            logger.error("❌ DEBUG: JSON FAILURE RESPONSE \(error.localizedDescription)")
        }
    }
}
