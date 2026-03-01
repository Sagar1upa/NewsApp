//
//  APIClientProtocol.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import Foundation

protocol APIClientProtocol {
    func request<T: Decodable>(_ request: URLRequest) async throws -> T
}
