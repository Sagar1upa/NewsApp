//
//  EmptyStateView.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import SwiftUI

struct EmptyStateView: View {
    let message: String

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "newspaper")
                .font(.largeTitle)
                .foregroundColor(.gray)

            Text(message)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}
