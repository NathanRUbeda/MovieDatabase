//
//  MovieViewModel.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/5/24.
//

import Foundation

/// An object that is used to model data with home view.
@Observable
class MovieViewModel {
	/// Array of movies.
	var movies = [Movie]()
	
	/// Array of popular movies.
	var popularMovies = [Movie]()
	
	/// Array of now playing movies.
	var nowPlayingMovies = [Movie]()
	
	/// Array of top rated movies.
	var topRatedMovies = [Movie]()
	
	/// Array of upcoming movies.
	var upcomingMovies = [Movie]()
	
	/// An object that interacts with a cloud service.
	var webService: MovieProvider?
	
	init(
		movies: [Movie] = [Movie](),
		popularMovies: [Movie] = [Movie](),
		nowPlayingMovies: [Movie] = [Movie](),
		topRatedMovies: [Movie] = [Movie](),
		upcomingMovies: [Movie] = [Movie](),
		webService: MovieProvider = MovieWebService()
	) {
		self.movies = movies
		self.popularMovies = popularMovies
		self.nowPlayingMovies = nowPlayingMovies
		self.topRatedMovies = topRatedMovies
		self.upcomingMovies = upcomingMovies
		self.webService = webService
	}
	
	/// Fetches movies based on user's input.
	/// - Parameters:
	/// - query: A searched word inputted by the user.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchSearchedMovies(query: String) async throws -> MovieResponse {
		guard let webService else {
			throw NSError(domain: "MovieViewModel", code: 0)
		}
		
		guard !query.isEmpty else {
			print("empty query")
			return MovieResponse(results: [])
		}
		
		print("query is not empty")
		return try await webService.fetchSearchedMovies(query: query)
	}
	
	/// Fetches popular movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchPopularMovies() async throws -> MovieResponse {
		guard let webService else {
			throw NSError(domain: "MovieViewModel", code: 0)
		}
		
		return try await webService.fetchPopularMovies()
	}
	
	/// Fetches now playing movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchNowPlayingMovies() async throws -> MovieResponse {
		guard let webService else {
			throw NSError(domain: "MovieViewModel", code: 0)
		}
		
		return try await webService.fetchNowPlayingMovies()
	}
	
	/// Fetches top rated movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchTopRatedMovies() async throws -> MovieResponse {
		guard let webService else {
			throw NSError(domain: "MovieViewModel", code: 0)
		}
		
		return try await webService.fetchTopRatedMovies()
	}
	
	/// Fetches upcoming movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchUpcomingMovies() async throws -> MovieResponse {
		guard let webService else {
			throw NSError(domain: "MovieViewModel", code: 0)
		}
		
		return try await webService.fetchUpcomingMovies()
	}
}
