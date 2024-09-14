//
//  NetworkService.swift
//  MockWebService
//
//  Created by Jason Sanchez on 9/14/24.
//

import Foundation

protocol NetworkService {
    func login(username: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void)
}
