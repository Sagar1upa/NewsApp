//
//  BookmarkEntity+Mapper.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import Foundation

extension BookmarkEntity {

    func toArticle() -> Article {
        Article(
            id: self.id ?? "",
            title: self.title ?? "",
            description: self.desc,
            content: nil,
            url: self.url ?? "",
            image: self.image,
            publishedAt: self.publishedAt ?? "",
            lang: nil,
            source: Source(
                id: nil,
                name: self.source ?? "",
                url: nil
            )
        )
    }
}
