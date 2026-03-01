//
//  NewsFeedViewModel.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import Foundation
import Foundation
import SwiftUI
internal import Combine

@MainActor
final class NewsFeedViewModel: ObservableObject {

    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var showToast = false
    @Published var toastMessage = ""
    
    private let repository: NewsRepositoryProtocol
    private var page = 1
    private var canLoadMore = true

    init(repository: NewsRepositoryProtocol = NewsRepository()) {
        self.repository = repository
    }

    func loadNews() async {
        guard !isLoading, canLoadMore else { return }

        isLoading = true
        toastMessage = ""

        do {
            let newArticles = try await repository.fetchTopHeadlines(page: page)

            if newArticles.isEmpty {
                canLoadMore = false
            } else {
                articles.append(contentsOf: newArticles)
                page += 1
            }

        } catch {
            toastMessage = error.localizedDescription
            showToast = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.showToast = false
            }
            print(error.localizedDescription)
        }

        isLoading = false
    }
}
