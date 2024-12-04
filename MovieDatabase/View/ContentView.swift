//
//  ContentView.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/4/24.
//

import SwiftUI

/// Displays a TabView with views for an Explore page and a Search page.
struct ContentView: View {
	 var viewModel: MovieViewModel
	
	var body: some View {
		TabView {
			ExploreView(viewModel: viewModel)
				.tabItem {
					Image(systemName: "globe")
				}
			
			SearchView(viewModel: viewModel)
				.tabItem {
					Image(systemName: "magnifyingglass")
				}
		}
	}
}

