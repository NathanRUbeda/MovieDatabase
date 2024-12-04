//
//  MovieServer.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/6/24.
//

import Foundation

// CRUD:
// Create
// Read
// Update
// Delete

class WebService {
	// TODO: Write documentation
	func dispatch<T: Decodable>(using request: WebServiceRequest) async throws -> T {
		try await self._dispatch(using: request)
	}
	
	/// Builds and sends URL request with the given `WebServiceRequest`.
	/// - Throws: An error if the URL can't be built or if encountered or returned when sending the URL request.
	/// - Returns: The value returned from the URL decoded to the specified type.
	private func _dispatch<T: Decodable>(using request: WebServiceRequest, queries: [URLQueryItem]? = nil) async throws -> T {
		guard let authorizationHeader = ProcessInfo.processInfo.environment["Authorization"] else {
			throw NetworkError.missingAuthorization
		}
		
		guard let url = URL(string: Constants.MovieAPI.baseURL + request.endpoint) else {
			throw NetworkError.invalidURL
		}
		
		var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
		urlComponents?.queryItems = queries
		var request = URLRequest(url: urlComponents?.url ?? url)
		request.httpMethod = request.httpMethod
		request.timeoutInterval = 10
		request.allHTTPHeaderFields = [
			"accept" : "application/json",
			"Authorization" : "Bearer \(authorizationHeader)"
		]
		
		let (data, _) = try await URLSession.shared.data(for: request)
		return try decode(data)
	}
	
//	private func get<T: Decodable>(from url: URL) async throws -> T {
//		
//	}
	
	func decode<T: Decodable>(_ data: Data) throws -> T {
		let decoder = JSONDecoder()
		return try decoder.decode(T.self, from: data)
	}
	
	struct WebServiceRequest {
		/// The type of method to use.
		let httpMethod: String
		/// The endpoint to call.
		let endpoint: String
		let headers: [String: Any]?
		let queries: [URLQueryItem]?
//		let queries: [URLQueryItem]
//		let queries: [String: Any]?
	}
}

class MovieWebService: WebService, MovieProvider {
	func fetchSearchedMovies(query: String) async throws -> MovieResponse {
		return try await self.dispatch(
			using: WebServiceRequest(
				httpMethod: "GET",
				endpoint: "search",
				headers: nil,
				queries: [
					URLQueryItem(name: "query", value: query)
				]
			)
		)
	}
	
//	static let imagePath = "https://image.tmdb.org/t/p/w500/"
//	static let baseURL = "https://api.themoviedb.org/3/movie/"
//	static let searchURL = "https://api.themoviedb.org/3/search/movie"

	func fetchPopularMovies() async throws -> MovieResponse {
		return try await self.dispatch(
			using: WebServiceRequest(
				httpMethod: "GET",
				endpoint: "popular",
				headers: nil,
				queries: nil
			)
		)
	}
	
	func fetchNowPlayingMovies() async throws -> MovieResponse {
		return try await self.dispatch(
			using: WebServiceRequest(
				httpMethod: "GET",
				endpoint: "now_playing",
				headers: nil,
				queries: nil
			)
		)
	}
	
	func fetchTopRatedMovies() async throws -> MovieResponse {
		return try await self.dispatch(
			using: WebServiceRequest(
				httpMethod: "GET",
				endpoint: "top_rated",
				headers: nil,
				queries: nil
			)
		)
	}

	func fetchUpcomingMovies() async throws -> MovieResponse {
		return try await self.dispatch(
			using: WebServiceRequest(
				httpMethod: "GET",
				endpoint: "upcoming",
				headers: nil,
				queries: nil
			)
		)
	}

	

	
}
