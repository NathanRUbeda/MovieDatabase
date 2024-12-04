//
//  MovieDatabaseApp.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/4/24.
//

import SwiftUI

@main
struct MovieDatabaseApp: App {
	var viewModel = MovieViewModel()
	
	init() {
		self._fetchInitialMovies()
	}
	
    var body: some Scene {
        WindowGroup {
			ContentView(viewModel: viewModel)
        }
    }
	
	/// Fetches movies for initial view.
	private func _fetchInitialMovies() {
		Task {
			do {
				let popularMovies = try await self._fetchPopularMovies()
				self.viewModel.popularMovies = popularMovies
				
				let nowPlayingMovies = try await self._fetchNowPlayingMovies()
				self.viewModel.nowPlayingMovies = nowPlayingMovies
				
				let topRatedMovies = try await self._fetchTopRatedMovies()
				self.viewModel.topRatedMovies = topRatedMovies
				
				let upcomingMovies = try await self._fetchUpcomingMovies()
				self.viewModel.upcomingMovies = upcomingMovies
			} catch {
				print(error)
			}
		}
	}
	
	/// Sends request to get popular movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	private func _fetchPopularMovies() async throws -> [Movie] {
		let response = try await self.viewModel.fetchPopularMovies()
		return response.results
	}
	
	/// Sends request to get now playing movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	private func _fetchNowPlayingMovies() async throws -> [Movie] {
		let response = try await self.viewModel.fetchNowPlayingMovies()
		return response.results
	}
	
	/// Sends request to get top rated movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	private func _fetchTopRatedMovies() async throws -> [Movie] {
		let response = try await self.viewModel.fetchTopRatedMovies()
		return response.results
	}
	
	
	private func _fetchUpcomingMovies() async throws -> [Movie] {
		let response = try await self.viewModel.fetchUpcomingMovies()
		return response.results
	}
}
