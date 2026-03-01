//
//  NewsFeedView.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//
import SwiftUI
struct NewsFeedView: View {

    @StateObject private var viewModel = NewsFeedViewModel()
    @State private var selectedArticle: Article?

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.articles.isEmpty && !viewModel.isLoading {
                    EmptyStateView(message: "No news available")
                } else {
                    List {
                        ForEach(viewModel.articles) { article in
                            ArticleRowView(article: article)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedArticle = article
                                }
                                .onAppear {
                                    if article == viewModel.articles.last {
                                        Task { await viewModel.loadNews() }
                                    }
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
                                .listRowBackground(Color.clear)
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationTitle("News")
            .navigationDestination(item: $selectedArticle) { article in
                ArticleDetailView(article: article)
            }
            .refreshable {
                await viewModel.loadNews()
            }
            .task {
                await viewModel.loadNews()
            }
        }
        .toast(isShowing: $viewModel.showToast,
               message: viewModel.toastMessage,
               isError: true)
    }
}
//
//#Preview {
//    NewsFeedView()
//}
