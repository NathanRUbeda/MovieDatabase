//
//  MovieDetailView.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/4/24.
//

import SwiftUI

/// Displays a VStack with detailed information about the movie.
struct MovieDetailView: View {
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
		VStack {
			if let poster = movie.backdropPath {
				AsyncImage(url: URL(string: Constants.MovieAPI.imagePath + poster)) { phase in
					if let image = phase.image {
						image
							.resizable()
							.scaledToFill()
							.frame(maxWidth: .infinity)
							.frame(height: 300)
							.ignoresSafeArea()
						
					} else if phase.error != nil {
						self.errorView
					} else {
						self.loadingView
					}
				}
			}
			
			self.movieInfoSection
		}
		
		Spacer()
	}
	
	/// Displays information about the movie such as title, release data, poster and overview.
	private var movieInfoSection: some View {
		VStack(alignment: .leading) {
			HStack {
				VStack(alignment: .leading) {
					Text(movie.title)
						.font(.title)
						.fontWeight(.semibold)
					
					HStack {
						Text(releaseDate, format: .dateTime.year())
					}
					.font(.subheadline)
					.foregroundStyle(.black.opacity(0.7))
				}
				
				Spacer()
				
				MoviePosterView(movie: movie, width: 100, height: 150)
			}
			.padding(.bottom)
			
			
			Text(movie.overview)
				.font(.subheadline)
				.foregroundStyle(.black.opacity(0.7))
		}
		.padding(.horizontal)
	}
	
	/// Displays a gray Rectangle.
	private var errorView: some View {
		Rectangle()
			.foregroundStyle(.gray)
			.frame(maxWidth: .infinity)
			.frame(height: 300)
			.ignoresSafeArea()
	}
	
	/// Displays a ProgressView.
	private var loadingView: some View {
		ProgressView()
			.frame(width: 100, height: 150)
	}
}

#Preview {
	MovieDetailView(
		movie: .init(
			backdropPath: "",
			id: 5,
			originalTitle: "",
			overview: "",
			posterPath: "",
			releaseDate: "",
			title: ""
		)
	)
}
