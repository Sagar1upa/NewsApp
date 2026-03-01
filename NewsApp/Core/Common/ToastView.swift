//
//  ToastView.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import SwiftUI

struct ToastView: View {

    let message: String
    let isError: Bool

    var body: some View {
        HStack(spacing: 12) {

            Image(systemName: isError ? "exclamationmark.circle.fill" : "checkmark.circle.fill")
                .foregroundColor(.white)

            Text(message)
                .font(.subheadline)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)

            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(isError ? Color.red : Color.green)
        )
        .shadow(radius: 6)
        .padding(.horizontal)
    }
}
//
//#Preview {
//    ToastView(message: "Error mesage", isError: false)
//}
