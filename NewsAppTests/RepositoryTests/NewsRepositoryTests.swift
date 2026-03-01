//
//  NewsRepositoryTests.swift
//  NewsAppTests
//
//  Created by Mintoak on 01/03/26.
//

import XCTest
@testable import NewsApp

final class NewsRepositoryTests: XCTestCase {

    var repository: NewsRepository!
    var mockAPI: MockAPIClient!

    override func setUp() {
        super.setUp()
        mockAPI = MockAPIClient()
        repository = NewsRepository(apiClient: mockAPI)
    }

    override func tearDown() {
        repository = nil
        mockAPI = nil
        super.tearDown()
    }

    func test_fetchNews_success_returnsArticles() async throws {
        mockAPI.mockArticles = [
            Article.mock(id: "1"),
            Article.mock(id: "2")
        ]

        let articles = try await repository.fetchTopHeadlines(page: 1)

        XCTAssertEqual(articles.count, 2)
    }

    func test_fetchNews_failure_throwsError() async {
        mockAPI.shouldFail = true

        do {
            _ = try await repository.fetchTopHeadlines(page: 1)
            XCTFail("Expected error")
        } catch {
            XCTAssertTrue(true)
        }
    }
}
