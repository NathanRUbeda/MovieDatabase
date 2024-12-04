//
//  ContentView.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/4/24.
//

import SwiftUI

struct ContentView: View {
	@State private var query = ""
	@State private var movies: MovieResponse?
	let movieClient = MovieClient()
	
	var body: some View {
		NavigationStack {
			ScrollView {
				VStack {
					TextField("Search for a movie...", text: $query)
						.onSubmit {
							Task {
								do {
									self.movies = try await movieClient.fetchSearchedMovies(query: query)
								} catch {
									print(error)
								}
							}
						}
					
					if let movies {
						ForEach(movies.results) { movie in
							NavigationLink {
								MovieDetailView(movie: movie)
							} label: {
								VStack {
									MoviePosterView(movie: movie)
									
									Text(movie.title)
								}
							}
						}
					}
				}
			}
		}
	}
}

#Preview {
    ContentView()
}
