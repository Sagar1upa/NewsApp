//
//  RootTabView.swift
//  NewsApp
//
//  Created by Sagar Upadhyay on 28/02/26.
//

import Foundation
import SwiftUI

struct RootTabView: View {

    var body: some View {
        TabView {
            
            NewsFeedView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            
            BookmarksView()
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}
