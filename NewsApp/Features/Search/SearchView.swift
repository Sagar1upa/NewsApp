//
//  SearchView.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 01/03/26.
//

import SwiftUI

struct SearchView: View {

    @StateObject private var viewModel = SearchViewModel()
    @State private var searchText = ""
    @State private var selectedArticle: Article?
    @FocusState private var isSearching: Bool
    @State private var searchTask: Task<Void, Never>?

    var body: some View {
        NavigationStack {
            Group {
                if searchText.isEmpty && !viewModel.hasSearched {
                    EmptyStateView(message: "Search news, topics, or sources")
                    
                }else if viewModel.articles.isEmpty && viewModel.hasSearched {
                    EmptyStateView(message: "No results found")
                    
                }else {
                    List {
                        ForEach(viewModel.articles, id: \.url) { article in
                            ArticleRowView(article: article)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedArticle = article
                                }
                                .onAppear {
                                    viewModel.loadMoreIfNeeded(currentItem: article)
                                }
                                .listRowSeparator(.hidden)
                                .listRowInsets(
                                    EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
                                )
                                .listRowBackground(Color.clear)
                        }

                        if viewModel.isLoading {
                            ProgressView()
                                .frame(maxWidth: .infinity)
                                .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationTitle("Search")
            .navigationDestination(item: $selectedArticle) { article in
                ArticleDetailView(article: article)
            }
        }
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search news"
        )
        .focused($isSearching)
        .onChange(of: searchText) { _, newValue in
            debounceSearch(newValue)
        }
    }
    
    private func debounceSearch(_ text: String) {
        searchTask?.cancel()
        
        guard !text.isEmpty else {
            viewModel.search(query: "")
            return
        }
        
        searchTask = Task {
            try? await Task.sleep(nanoseconds: 400 * 1_000_000)
            await MainActor.run {
                viewModel.search(query: text)
            }
        }
    }
}
