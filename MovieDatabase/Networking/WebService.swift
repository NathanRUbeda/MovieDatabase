//
//  WebService.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/6/24.
//

import Foundation

/// An object that interacts with a cloud service.
class WebService {
	/// Dispatches data utilizing a `WebServiceRequest`.
	/// - Parameters:
	/// -  request: A `WebServiceRequest` containing the request settings.
	/// - Throws: An error if the URL can't be built or if encountered or returned when sending the URL request.
	/// - Returns: The value returned from the URL decoded to the specified type.
	func dispatch<T: Decodable>(using request: WebServiceRequest) async throws -> T {
		try await self._dispatch(using: request)
	}
	
	/// Builds and sends URL request with the given `WebServiceRequest`.
	/// - Parameters:
	/// -  request: A `WebServiceRequest` containing the request settings.
	/// - queries: 
	/// - Throws: An error if the URL can't be built or if encountered or returned when sending the URL request.
	/// - Returns: The value returned from the URL decoded to the specified type.
	private func _dispatch<T: Decodable>(using request: WebServiceRequest, queries: [URLQueryItem]? = nil) async throws -> T {
		guard let authorizationHeader = ProcessInfo.processInfo.environment["Authorization"] else {
			throw NetworkError.missingAuthorization
		}
		
		guard let url = URL(string: request.url + request.endpoint) else {
			throw NetworkError.invalidURL
		}
		
		var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
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
	
	/// Decodes data received from request.
	func decode<T: Decodable>(_ data: Data) throws -> T {
		let decoder = JSONDecoder()
		return try decoder.decode(T.self, from: data)
	}
	
	/// An object that represents a web service request.
	struct WebServiceRequest {
		/// The URL of the cloud service.
		let url: String
		/// The type of method to use.
		let httpMethod: String
		/// The endpoint to call.
		let endpoint: String
		/// The headers of the request.
		let headers: [String: Any]?
		/// The queries of the request.
		let queries: [URLQueryItem]?
	}
}

