//
//  MovieProvider.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/6/24.
//

import Foundation

/// An object that provides movies.
protocol MovieProvider {
	/// Sends request to get movies based on searched input.
	/// - Parameters:
	/// - query: A searched word inputted by the user.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchSearchedMovies(query: String) async throws -> MovieResponse
	
	/// Sends request to get popular movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchPopularMovies() async throws -> MovieResponse
	
	/// Sends request to get now playing movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchNowPlayingMovies() async throws -> MovieResponse

	/// Sends request to get top rated movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchTopRatedMovies() async throws -> MovieResponse
	
	/// Sends request to get upcoming movies.
	/// - Returns: A `MovieResponse` object.
	/// - Throws: A `NetworkError` if unable to build request or encountered during processing of request.
	func fetchUpcomingMovies() async throws -> MovieResponse
	
}
