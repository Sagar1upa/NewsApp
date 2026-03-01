//
//  Endpoint.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import Foundation

enum Endpoint {

    static let apiKey = "c422dfbce518b5d8b6fd9b5827962da7"//GNews API Key

    static func topHeadlines(page: Int) -> URLRequest {
        var components = URLComponents(string: "https://gnews.io/api/v4/top-headlines")!

        components.queryItems = [
            .init(name: "token", value: apiKey),
            .init(name: "lang", value: "en"),
            .init(name: "max", value: "10"),
            .init(name: "page", value: "\(page)")
        ]

        return URLRequest(url: components.url!)
    }

    static func search(query: String, page: Int) -> URLRequest {
        var components = URLComponents(string: "https://gnews.io/api/v4/search")!

        components.queryItems = [
            .init(name: "token", value: apiKey),
            .init(name: "q", value: query),
            .init(name: "lang", value: "en"),
            .init(name: "max", value: "10"),
            .init(name: "page", value: "\(page)")
        ]

        return URLRequest(url: components.url!)
    }
}
