//
//  MovieWebService_Tests.swift
//  MovieDatabaseTests
//
//  Created by Nathan Ubeda on 11/30/24.
//

import XCTest
@testable import MovieDatabase

final class MovieWebService_Tests: XCTestCase {
	var webService: MovieProvider?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
		webService = MockWebService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		webService = nil
    }

	func test_WebService_fetchSearchedMovies_shouldFetchSearchedMovies() async throws {
		// Given
		guard let webService else {
			XCTFail()
			return
		}
		
		// When
		let queries = ["spiderman", "whiplash", "how to train your dragon"]
		
		// Then
		for query in queries {
			let response = try await webService.fetchSearchedMovies(query: query)
			XCTAssertNotNil(response)
		}
	}
	
	func test_WebService_fetchPopularMovies_shouldFetchPopularMovies() async throws {
		// Given
		guard let webService else {
			XCTFail()
			return
		}
		
		// When
		let response = try await webService.fetchPopularMovies()
		
		// Then
		XCTAssertNotNil(response)
	}
	
	func test_WebService_fetchNowPlayingMovies_shouldFetchNowPlayingMovies() async throws {
		// Given
		guard let webService else {
			XCTFail()
			return
		}
		
		// When
		let response = try await webService.fetchNowPlayingMovies()
		
		// Then
		XCTAssertNotNil(response)
	}
	
	func test_WebService_fetchTopRatedMovies_shouldFetchTopRatedMovies() async throws {
		// Given
		guard let webService else {
			XCTFail()
			return
		}
		
		// When
		let response = try await webService.fetchTopRatedMovies()
		
		// Then
		XCTAssertNotNil(response)
	}
	
	func test_WebService_fetchUpcomingMovies_shouldFetchUpcomingMovies() async throws {
		// Given
		guard let webService else {
			XCTFail()
			return
		}
		
		// When
		let response = try await webService.fetchUpcomingMovies()
		
		// Then
		XCTAssertNotNil(response)
	}
}
