//
//  ApiClient.swift
//  FoursquareApp
//
//  Created by Ahmet Muhammet Vural on 28.12.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import UIKit
import SimpleApiClient

class ApiClient: SimpleApiClient {
    static var shared: ApiClient = {
        let config = SimpleApiClient.Config(
            baseUrl: apiURL,
            timeout: 30,
            errorMessageKeyPath: "error",
            jsonDecoder: JSONDecoder(),
            isMockResponseEnabled: true,
            logHandler: { request, response in
               
        },
            errorHandler: { error in
                switch error {
                case .authenticationError(let code, let message):
                    print("authenticationError: \(code) \(message)")
                case .clientError(let code, let message):
                    print("clientError: \(code) \(message)")
                case .serverError(let code, let message):
                    print("serverError: \(code) \(message)")
                case .networkError(let source):
                    print("networkError")
                case .sslError(let source):
                    print("sslError")
                case .uncategorizedError(let source):
                    print("uncategorizedError")
                }
        }
        )
        return ApiClient(config: config)
    }()
}
