//
//  NewsFeedViewModelTests.swift
//  NewsAppTests
//
//  Created by Mintoak on 01/03/26.
//

import XCTest
@testable import NewsApp

@MainActor
final class NewsFeedViewModelTests: XCTestCase {

    var viewModel: NewsFeedViewModel!
    var mockAPI: MockAPIClient!
    var repository: NewsRepository!

    override func setUp() {
        super.setUp()
        mockAPI = MockAPIClient()
        repository = NewsRepository(apiClient: mockAPI)
        viewModel = NewsFeedViewModel(repository: repository)
    }

    override func tearDown() {
        viewModel = nil
        repository = nil
        mockAPI = nil
        super.tearDown()
    }

    // MARK: - Load News Success

    func test_loadNews_success_updatesArticles() async {
        mockAPI.mockArticles = [
            Article.mock(id: "1"),
            Article.mock(id: "2")
        ]

        await viewModel.loadNews()
        
        XCTAssertEqual(viewModel.articles.count, 2)
        XCTAssertFalse(viewModel.showToast)
    }

    // MARK: - Load News Failure

    func test_loadNews_failure_showsToast() async {
        mockAPI.shouldFail = true
        await viewModel.loadNews()
        
        XCTAssertTrue(viewModel.showToast)
    }
}
