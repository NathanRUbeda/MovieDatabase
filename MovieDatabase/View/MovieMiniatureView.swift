//
//  MovieMiniatureView.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/4/24.
//

import SwiftUI

/// Display a miniature of the movie, including poster, title and release date.
struct MovieMiniatureView: View {
	var releaseDate: Date {
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.dateFormat = "yyyy-MM-dd"
		formatter.timeZone = TimeZone(secondsFromGMT: 0)
		let date = formatter.date(from: movie.releaseDate)
		
		return date ?? Date.now
	}
	
	let movie: Movie
	
    var body: some View {
		HStack {
			MoviePosterView(movie: movie, width: 70, height: 100)
			
			self.movieTitle
			
			self.movieReleaseDate
		}
    }
	
	/// Displays a text with the title of the movie.
	private var movieTitle: some View {
		Text(movie.title)
			.font(.headline)
			.fontWeight(.semibold)
			.foregroundStyle(.black)
	}
	
	/// Displays a text with the release date of the movie.
	private var movieReleaseDate: some View {
		Text(releaseDate, format: .dateTime.year())
			.font(.callout)
			.foregroundStyle(.gray)
	}
}

#Preview {
	MovieMiniatureView(movie: .init(
		backdropPath: "",
		id: 5,
		originalTitle: "",
		overview: "",
		posterPath: "",
		releaseDate: "",
		title: ""
	))
}
