//
//  Constants.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/5/24.
//

import Foundation

/// A namespace for constant values that do not change across the application.
enum Constants { }

extension Constants {
	/// A namespace for API related stuff.
	enum MovieAPI {
		static let imagePath = "https://image.tmdb.org/t/p/w500/"
		static let baseURL = "https://api.themoviedb.org/3/movie/"
		static let searchURL = "https://api.themoviedb.org/3/search/"
		
		static let popularURL = baseURL + "popular"
		static let nowPlayingURL = baseURL + "now_playing"
		static let topRatedURL = baseURL + "top_rated"
		static let upcomingURL = baseURL + "upcoming"
	}
}
