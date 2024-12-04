//
//  ExploreView.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/4/24.
//

import SwiftUI

/// Displays a NavigationStack with ScrollViews for different movie categories.
struct ExploreView: View {
	let viewModel: MovieViewModel
	
    var body: some View {
		NavigationStack {
			ScrollView {
				VStack (alignment: .leading) {
					self.popularMoviesText
					
					MovieScrollView(movies: viewModel.popularMovies)
					
					self.nowPlayingMoviesText
					
					MovieScrollView(movies: viewModel.nowPlayingMovies)
					
					self.topRatedMoviesText
					
					MovieScrollView(movies: viewModel.topRatedMovies)
					
					self.upcomingMoviesText
					
					MovieScrollView(movies: viewModel.upcomingMovies)
					
					Spacer()
				}
				.safeAreaPadding()
			}
			.navigationTitle("Explore")
			.navigationBarTitleDisplayMode(.inline)
		}
    }
	
	/// Displays a text indicating popular movies.
	private var popularMoviesText: some View {
		Text("Popular movies")
			.font(.headline)
			.fontWeight(.semibold)
	}
	
	/// Displays a text indicating now playing movies.
	private var nowPlayingMoviesText: some View {
		Text("Now playing movies")
			.font(.headline)
			.fontWeight(.semibold)
	}
	
	/// Displays a text indicating top rated movies.
	private var topRatedMoviesText: some View {
		Text("Top rated movies")
			.font(.headline)
			.fontWeight(.semibold)
	}
	
	/// Displays a text indicating upcoming movies.
	private var upcomingMoviesText: some View {
		Text("Upcoming movies")
			.font(.headline)
			.fontWeight(.semibold)
	}
}

