//
//  Constants.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/5/24.
//

import Foundation

enum Constants { }

extension Constants {
	enum MovieAPI {
		static let baseURL = "https://api.themoviedb.org/3/movie/"
		static let searchURL = "https://api.themoviedb.org/3/search/movie"
		
		static let popularURL = baseURL + "popular"
		static let nowPlayingURL = baseURL + "now_playing"
		static let topRatedURL = baseURL + "top_rated"
		static let upcomingURL = baseURL + "upcoming"
	}
}
