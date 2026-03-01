//
//  BookmarkManaging.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import Foundation

protocol BookmarkManaging {
    func save(article: Article) throws
    func delete(article: Article) throws
    func fetchBookmarks() throws -> [BookmarkEntity]
    func isBookmarked(article: Article) -> Bool
}
