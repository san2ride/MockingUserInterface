//
//  NetworkServiceFactory.swift
//  MockWebService
//
//  Created by Jason Sanchez on 9/14/24.
//

import Foundation

class NetworkServiceFactory {
    
    static func create() -> NetworkService {
        let environmemt = ProcessInfo.processInfo.environment["ENV"]
        
        if let environmemt = environmemt {
            if environmemt == "TEST" {
                return MockWebService()
            } else {
                return WebService()
            }
        } else {
            return WebService()
        }
    }
}
