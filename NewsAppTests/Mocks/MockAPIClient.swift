//
//  MockAPIClient.swift
//  NewsAppTests
//
//  Created by Mintoak on 01/03/26.
//

import Foundation
@testable import NewsApp

final class MockAPIClient: APIClientProtocol {
    var shouldFail = false
    var mockArticles: [Article] = []

    func request<T>(_ request: URLRequest) async throws -> T where T : Decodable {

        if shouldFail {
            throw URLError(.badServerResponse)
        }

        // Only handling NewsResponse for now
        if T.self == NewsResponse.self {
            let response = NewsResponse(
                totalArticles: mockArticles.count, articles: mockArticles, information: NewsResponse.InfoWrapper(realTimeArticles: NewsResponse.InfoWrapper.MessageWrapper(message: ""))
            )
            return response as! T
        }

        throw URLError(.cannotDecodeContentData)
    }
}
