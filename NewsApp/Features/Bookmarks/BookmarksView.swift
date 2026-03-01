//
//  BookmarksView.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import SwiftUI

struct BookmarksView: View {

    @StateObject private var viewModel = BookmarkViewModel()
    @State private var selectedArticle: Article?

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.bookmarks.isEmpty {
                    EmptyStateView(message: "No bookmarks yet")
                } else {
                    List {
                        ForEach(viewModel.bookmarks, id: \.objectID) { bookmark in
                            BookmarkRowView(bookmark: bookmark)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedArticle = bookmark.toArticle()
                                }
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                                .listRowBackground(Color.clear)
                        }
                        .onDelete { indexSet in
                            indexSet.forEach { index in
                                let article = viewModel.bookmarks[index].toArticle()
                                viewModel.toggleBookmark(article: article)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationTitle("Bookmarks")
            .navigationDestination(item: $selectedArticle) { article in
                ArticleDetailView(article: article)
            }
            .onAppear {
                viewModel.loadBookmarks()
            }
        }
    }
}
//
//#Preview {
//    BookmarksView()
//}
