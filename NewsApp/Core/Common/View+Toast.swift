//
//  View+Toast.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import Foundation
import SwiftUI

struct ToastModifier: ViewModifier {

    @Binding var isShowing: Bool
    let message: String
    let isError: Bool

    func body(content: Content) -> some View {
        ZStack {
            content

            if isShowing {
                VStack {
                    Spacer()

                    ToastView(message: message, isError: isError)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .padding(.bottom, 30)
                }
                .animation(.easeInOut(duration: 0.3), value: isShowing)
            }
        }
    }
}

extension View {
    func toast(isShowing: Binding<Bool>, message: String, isError: Bool = true) -> some View {
        modifier(ToastModifier(isShowing: isShowing, message: message, isError: isError))
    }
}
