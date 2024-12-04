//
//  SearchView.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/4/24.
//

import SwiftUI

/// Displays a NavigationStack with a search bar and search results.
struct SearchView: View {
	@State var query = ""
	let viewModel: MovieViewModel
	
	var body: some View {
		NavigationStack {
			self.resultsScroller
				.searchable(text: $query)
				.onChange(of: query) {
					Task {
						do {
							self.viewModel.movies = try await _fetchSearchedMovies(
								query: query)
						} catch {
							print(error)
						}
					}
				}
				.navigationTitle("Search")
				.navigationBarTitleDisplayMode(.inline)
		}
	}
	
	/// Displays a ScrollView of NavigationLinks containing the search results.
	private var resultsScroller: some View {
		ScrollView {
			VStack(alignment: .leading) {
				ForEach(viewModel.movies) { movie in
					NavigationLink {
						MovieDetailView(movie: movie)
					} label: {
						MovieMiniatureView(movie: movie)
					}
					
					Divider()
				}
			}
			.padding(.horizontal)
		}
	}
	
	/// Sends request to get movies based on searched input.
	/// - Parameters:
	/// - query: A searched word inputted by the user.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	private func _fetchSearchedMovies(query: String) async throws -> [Movie] {
		let response = try await self.viewModel.fetchSearchedMovies(query: query)
		print("**** results: \(response.results)")
		return response.results
	}
}
