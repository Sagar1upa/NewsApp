//
//  Article+Mock.swift
//  NewsAppTests
//
//  Created by Mintoak on 01/03/26.
//

import Foundation
@testable import NewsApp

extension Article {

    static func mock(id: String = UUID().uuidString) -> Article {
        Article(
            id: id,
            title: "Match Report & Highlights",
            description: "Report and free match highlights as Wolves beat Aston Villa 2-0 at Molineux.",
            content: "The Premier League's bottom club Wolves stunned third-placed Aston Villa with a 2-0 win.",
            url: "https://www.skysports.com/football/wolves-vs-aston-villa/report/531408",
            image: "https://e0.365dm.com/26/02/1600x900/skysports-joao-gomes-wolves_7177211.jpg?20260227214713",
            publishedAt: "2026-02-27T23:48:30Z",
            lang: "eng",
            source: Source(
                id: "375c6022b40a085995083df0ed1ac413",
                name: "Sky Sports",
                url: "https://www.skysports.com"
            )
        )
    }
}
