//
//  MovieResponse.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 12/2/24.
//

import Foundation

/// An object that represents an array of movies.
struct MovieResponse: Codable {
	/// Array of movies retrivied from API call.
	let results: [Movie]
}
