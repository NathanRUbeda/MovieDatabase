//
//  MockWebService.swift
//  MovieDatabaseTests
//
//  Created by Nathan Ubeda on 11/30/24.
//

import Foundation
@testable import MovieDatabase

/// An object that mimics an interaction with a cloud service using a JSON file.
class MockWebService: WebService, MovieProvider {
	/// Sends request to get movies based on searched input.
	/// - Parameters:
	/// - query: A searched word inputted by the user.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchSearchedMovies(query: String) async throws -> MovieDatabase.MovieResponse {
		let url: URL? = switch query {
			case "spiderman":
				Bundle.main.url(forResource: "mockSearchedSpidermanMovieJSON", withExtension: "json")
			case "whiplash":
				Bundle.main.url(forResource: "mockSearchedWhiplashMovieJSON", withExtension: "json")
			case "how to train your dragon":
				Bundle.main.url(forResource: "mockSearchedTrainYourDragonMovieJSON", withExtension: "json")
			default:
				nil
		}
		
		guard let jsonURL = url else {
			throw NetworkError.missingJSON
		}
		
		guard let data = try? Data(contentsOf: jsonURL) else {
			throw NetworkError.loadingError
		}
		
		return try decode(data)
	}

	/// Sends request to get popular movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchPopularMovies() async throws -> MovieDatabase.MovieResponse {
		guard let jsonURL = Bundle.main.url(forResource: "mockPopularMoviesJSON", withExtension: "json") else {
			throw NetworkError.missingJSON
		}
		
		guard let data = try? Data(contentsOf: jsonURL) else {
			throw NetworkError.loadingError
		}
		
		return try decode(data)
	}

	/// Sends request to get now playing movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchNowPlayingMovies() async throws -> MovieDatabase.MovieResponse {
		guard let jsonURL = Bundle.main.url(forResource: "mockNowPlayingMoviesJSON", withExtension: "json") else {
			throw NetworkError.missingJSON
		}
		
		guard let data = try? Data(contentsOf: jsonURL) else {
			throw NetworkError.loadingError
		}
		
		return try decode(data)
	}

	/// Sends request to get top rated movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchTopRatedMovies() async throws -> MovieDatabase.MovieResponse {
		guard let jsonURL = Bundle.main.url(forResource: "mockTopRatedMoviesJSON", withExtension: "json") else {
			throw NetworkError.missingJSON
		}
		
		guard let data = try? Data(contentsOf: jsonURL) else {
			throw NetworkError.loadingError
		}
		
		return try decode(data)
	}

	/// Sends request to get upcoming movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchUpcomingMovies() async throws -> MovieDatabase.MovieResponse {
		guard let jsonURL = Bundle.main.url(forResource: "mockUpcomingMoviesJSON", withExtension: "json") else {
			throw NetworkError.missingJSON
		}
		
		guard let data = try? Data(contentsOf: jsonURL) else {
			throw NetworkError.loadingError
		}
		
		return try decode(data)
	}
}
