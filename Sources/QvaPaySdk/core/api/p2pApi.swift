//
//  File.swift
//  QvaPaySdk
//
//  Created by Pedro Omar  on 1/15/26.
//

import Foundation
import os.log

@available(macOS 11, iOS 15, *)
public class P2PApi : @unchecked Sendable {
    public static let shared = P2PApi()
    let logger = Logger()
    let session : URLSession = {
        let delegate = SessionDelegate.shared
        let configuration = URLSessionConfiguration.default
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        configuration.timeoutIntervalForRequest = 10
        return URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
    }()
}
