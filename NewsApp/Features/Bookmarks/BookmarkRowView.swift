//
//  BookmarkRowView.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import SwiftUI

struct BookmarkRowView: View {

    let bookmark: BookmarkEntity

    var body: some View {
        HStack(spacing: 12) {

            AsyncImage(url: URL(string: bookmark.image ?? "")) { image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 100, height: 80)
            .clipped()
            .cornerRadius(10)

            VStack(alignment: .leading, spacing: 6) {
                Text(bookmark.title ?? "")
                    .font(.headline)
                    .lineLimit(2)

                Text(bookmark.source ?? "")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray.opacity(0.6))
                .font(.system(size: 14, weight: .semibold))
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.secondarySystemBackground))
        )
        .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 3)
    }
}
