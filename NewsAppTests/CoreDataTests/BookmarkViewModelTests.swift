//
//  BookmarkViewModelTests.swift
//  NewsAppTests
//
//  Created by Mintoak on 01/03/26.
//

import XCTest
import CoreData
@testable import NewsApp

@MainActor
final class BookmarkViewModelTests: XCTestCase {

    var viewModel: BookmarkViewModel!
    var persistence: PersistenceController!

    override func setUp() {
        super.setUp()
        persistence = PersistenceController(inMemory: true)
        viewModel = BookmarkViewModel()
    }

    override func tearDown() {
        viewModel = nil
        persistence = nil
        super.tearDown()
    }

    // MARK: - Add Bookmark

    func test_toggleBookmark_addsBookmark() {
        let article = Article.mock(id: "101")
        viewModel.toggleBookmark(article: article)
        viewModel.loadBookmarks()
        
        XCTAssertEqual(viewModel.bookmarks.count, 1)
        viewModel.toggleBookmark(article: article)
    }

    // MARK: - Remove Bookmark

    func test_toggleBookmark_removesBookmark() {
        let article = Article.mock(id: "102")
        viewModel.toggleBookmark(article: article)
        viewModel.toggleBookmark(article: article)
        viewModel.loadBookmarks()
        
        XCTAssertEqual(viewModel.bookmarks.count, 0)
    }
}
