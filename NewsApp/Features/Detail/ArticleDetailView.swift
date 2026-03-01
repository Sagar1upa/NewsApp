//
//  ArticleDetailView.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import SwiftUI

struct ArticleDetailView: View {

    let article: Article
    @State private var showShare = false
    @StateObject private var bookmarkVM = BookmarkViewModel()

    var body: some View {
        VStack(spacing: 16) {

            AsyncImage(url: URL(string: article.image ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
            } placeholder: {
                ProgressView()
                    .frame(height: 200)
            }
            
            Text(article.title ?? "")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
                .multilineTextAlignment(.leading)
            
            if let desc = article.description, !desc.isEmpty {
                Text(desc)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
            
            Spacer(minLength: 80)

            Button {
                openInSafari()
            } label: {
                HStack {
                    Image(systemName: "safari.fill")
                    Text("Read full news in Safari")
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.accentColor)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .shadow(radius: 4)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .navigationTitle("News Detail")
        .navigationBarTitleDisplayMode(.inline)

        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {

                Button {
                    bookmarkVM.toggleBookmark(article: article)
                } label: {
                    Image(systemName: bookmarkVM.isBookmarked(article: article) ? "bookmark.fill" : "bookmark")
                        .scaleEffect(bookmarkVM.isBookmarked(article: article) ? 1.2 : 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6),
                                   value: bookmarkVM.isBookmarked(article: article))
                }

                Button {
                    showShare = true
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .sheet(isPresented: $showShare) {
            ShareSheet(items: [article.url ?? ""])
        }
    }
}

extension ArticleDetailView {
    func openInSafari() {
        guard let url = URL(string: article.url ?? "") else { return }
        UIApplication.shared.open(url)
    }
}

