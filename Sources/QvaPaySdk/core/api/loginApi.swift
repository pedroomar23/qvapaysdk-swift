//
//  loginApi.swift
//  QvaPaySdk
//
//  Created by Pedro Omar  on 1/15/26.
//

import Foundation
import os.log

@available(macOS 11, iOS 15, *)
public class LoginApi : @unchecked Sendable {
    public static let shared = LoginApi()
    let logger = Logger()
    let session : URLSession = {
        let delegate = SessionDelegate.shared
        let configuration = URLSessionConfiguration.default
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        configuration.timeoutIntervalForRequest = 10
        return URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
    }()
    
    // MARK: - Login
    
    public func login(email: String, password: String, two_factor_code: String, remember: Bool, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void) async {
        let decoder = JSONDecoder()
        let requestURL = EndpointUrl.login.url
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        request.timeoutInterval = 10
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Authorization", forHTTPHeaderField: "Access-Control-Allow-Headers")
        
        logger.info("✅ DEBUG: Iniciando Solicitud a POST \(requestURL.absoluteString)")
        
        let loginModel = LoginModel(
            email: email,
            password: password,
            two_factor_code: two_factor_code,
            remember: remember
        )
        
        do {
            let jsonBody = try? JSONEncoder().encode(loginModel)
            request.httpBody = jsonBody
            
            let (data, response) = try await session.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                logger.info("✅ DEBUG: SERVER RESPONSE \(httpResponse.statusCode)")
                
                if let jsonData = String(data: data, encoding: .utf8) {
                    logger.debug("✅ DEBUG: JSON DATA RESPONSE \(jsonData)")
                } else {
                    logger.error("❌ DEBUG: JSON DATA RESPONSE FAILURE")
                }
                
                switch httpResponse.statusCode {
                case 200:
                    let loginJSON = try decoder.decode(LoginResponse.self, from: data)
                    print("✅ DEBUG: JSON RESPONSE \(loginJSON)")
                    completion(.success(loginJSON))
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
    
    // MARK: - Login Request Pin
    
    public func requestPin(username: String, password: String, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void) async {
        let decoder = JSONDecoder()
        let requestURL = EndpointUrl.requestPin.url
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        request.timeoutInterval = 10
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        logger.info("✅ DEBUG: Iniciando Solicitud a POST \(requestURL.absoluteString)")
        
        let requestPin = RequestPin(
            username: username,
            password: password
        )
        
        do {
            let jsonBody = try? JSONEncoder().encode(requestPin)
            request.httpBody = jsonBody
            
            let (data, response) = try await session.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                logger.info("✅ DEBUG: SERVER RESPONSE \(httpResponse.statusCode)")
                
                if let jsonData = String(data: data, encoding: .utf8) {
                    logger.info("✅ DEBUG: JSON DATA \(jsonData)")
                } else {
                    logger.error("❌ DEBUG: JSON DATA FAILURE")
                }
                
                switch httpResponse.statusCode {
                case 200:
                    let requestJSON = try decoder.decode(LoginResponse.self, from: data)
                    print("✅ DEBUG: JSON RESPONSE \(requestJSON)")
                    completion(.success(requestJSON))
                case 400:
                    print("❌ DEBUG: STATUS CODE FAILURE \(NetworkError.statusCodeFailure(statusCode: httpResponse.statusCode))")
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
