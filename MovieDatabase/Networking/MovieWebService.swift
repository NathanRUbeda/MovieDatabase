//
//  MovieWebService.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/29/24.
//

import Foundation

/// An object that interacts with a cloud service.
class MovieWebService: WebService, MovieProvider {
	/// Sends request to get movies based on searched input.
	/// - Parameters:
	/// - query: A searched word inputted by the user.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchSearchedMovies(query: String) async throws -> MovieResponse {
		return try await self.dispatch(
			using: WebServiceRequest(
				url: Constants.MovieAPI.searchURL,
				httpMethod: "GET",
				endpoint: "movie",
				headers: nil,
				queries: [
					URLQueryItem(name: "query", value: query)
				]
			)
		)
	}
	
	/// Sends request to get popular movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchPopularMovies() async throws -> MovieResponse {
		return try await self.dispatch(
			using: WebServiceRequest(
				url: Constants.MovieAPI.baseURL,
				httpMethod: "GET",
				endpoint: "popular",
				headers: nil,
				queries: nil
			)
		)
	}
	
	/// Sends request to get now playing movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchNowPlayingMovies() async throws -> MovieResponse {
		return try await self.dispatch(
			using: WebServiceRequest(
				url: Constants.MovieAPI.baseURL,
				httpMethod: "GET",
				endpoint: "now_playing",
				headers: nil,
				queries: nil
			)
		)
	}
	
	/// Sends request to get top rated movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchTopRatedMovies() async throws -> MovieResponse {
		return try await self.dispatch(
			using: WebServiceRequest(
				url: Constants.MovieAPI.baseURL,
				httpMethod: "GET",
				endpoint: "top_rated",
				headers: nil,
				queries: nil
			)
		)
	}
	
	/// Sends request to get upcoming movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchUpcomingMovies() async throws -> MovieResponse {
		return try await self.dispatch(
			using: WebServiceRequest(
				url: Constants.MovieAPI.baseURL,
				httpMethod: "GET",
				endpoint: "upcoming",
				headers: nil,
				queries: nil
			)
		)
	}
}
