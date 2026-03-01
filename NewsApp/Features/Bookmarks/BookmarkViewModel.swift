//
//  BookmarkViewModel.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import SwiftUI
import Foundation
internal import Combine

@MainActor
final class BookmarkViewModel: ObservableObject {

    @Published var bookmarks: [BookmarkEntity] = []

    private let manager: BookmarkManaging

    init(manager: BookmarkManaging = BookmarkManager()) {
        self.manager = manager
        loadBookmarks()
    }

    func loadBookmarks() {
        do {
            bookmarks = try manager.fetchBookmarks()
        } catch {
            print("Fetch bookmark error:", error)
        }
    }

    func toggleBookmark(article: Article) {
        do {
            if manager.isBookmarked(article: article) {
                try manager.delete(article: article)
            } else {
                try manager.save(article: article)
            }
            loadBookmarks()
        } catch {
            print("Bookmark toggle error:", error)
        }
    }

    func isBookmarked(article: Article) -> Bool {
        manager.isBookmarked(article: article)
    }
}
