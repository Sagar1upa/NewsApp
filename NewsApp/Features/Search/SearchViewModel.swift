//
//  SearchViewModel.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 01/03/26.
//

import Foundation
internal import Combine

@MainActor
final class SearchViewModel: ObservableObject {

    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var showToast = false
    @Published var hasSearched = false
    @Published var toastMessage = ""

    private let repository: NewsRepositoryProtocol
    private var page = 1
    private var currentQuery = ""

    init(repository: NewsRepositoryProtocol = NewsRepository()) {
        self.repository = repository
    }

    func search(query: String) {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            articles = []
            hasSearched = false
            return
        }

        currentQuery = query
        page = 1
        Task { await fetch() }
    }

    func loadMoreIfNeeded(currentItem: Article) {
        guard currentItem == articles.last else { return }
        page += 1
        Task { await fetch(append: true) }
    }

    private func fetch(append: Bool = false) async {
        isLoading = true
        hasSearched = true

        do {
            let result = try await repository.search(query: currentQuery, page: page)
            if append {
                articles.append(contentsOf: result)
            } else {
                articles = result
            }
        } catch {
            toastMessage = error.localizedDescription
            showToast = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.showToast = false
            }
            print("Search error:", error.localizedDescription)
        }

        isLoading = false
    }
}
