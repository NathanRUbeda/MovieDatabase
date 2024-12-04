//
//  Movie.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/4/24.
//

import Foundation

/// An object that represents a movie.
struct Movie: Codable, Identifiable {
	/// The path for the backdrop used in the URL.
	let backdropPath: String?
	
	/// ID of the movie.
	let id: Int
	
	/// Original title of the movie.
	let originalTitle: String
	
	/// Overview of the movie.
	let overview: String
	
	/// The path for the poster used in the URL.
	let posterPath: String?
	
	/// Release date of the movie.
	let releaseDate: String
	
	/// Title of the movie.
	let title: String
	
	enum CodingKeys: String, CodingKey {
		case backdropPath = "backdrop_path"
		case id
		case originalTitle = "original_title"
		case overview
		case posterPath = "poster_path"
		case releaseDate = "release_date"
		case title
	}
}
