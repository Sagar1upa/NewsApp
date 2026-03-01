//
//  Article.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import Foundation

struct NewsResponse: Decodable {
    let totalArticles: Int?
    let articles: [Article]?
    let information: InfoWrapper?

    struct InfoWrapper: Decodable {
        let realTimeArticles: MessageWrapper?

        struct MessageWrapper: Decodable {
            let message: String?
        }
    }
}

struct Article: Decodable, Identifiable, Equatable, Hashable {
    
    let id: String?
    let title: String?
    let description: String?
    let content: String?
    let url: String?
    let image: String?
    let publishedAt: String?
    let lang: String?
    let source: Source?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Source: Decodable, Equatable, Hashable {
    let id: String?
    let name: String?
    let url: String?
}
