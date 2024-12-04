//
//  MoviePosterView.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/4/24.
//

import SwiftUI

/// Displays an AsyncImage of the poster of the movie.
struct MoviePosterView: View {
	let movie: Movie
	let width: CGFloat
	let height: CGFloat
	
    var body: some View {
		if let poster = movie.posterPath {
			AsyncImage(url: URL(string: Constants.MovieAPI.imagePath + poster)) { phase in
				if let image = phase.image {
					image
						.resizable()
						.frame(width: width, height: height)
						.scaledToFill()
						.clipShape(
							RoundedRectangle(cornerRadius: 4)
						)
						.overlay(
							RoundedRectangle(cornerRadius: 4)
								.stroke(.gray.opacity(0.4))
						)
					
				} else if phase.error != nil {
					self.errorView
				} else {
					self.loadingView
				}
			}
		} else {
			self.emptyView
		}
    }
	
	/// Displays a red RoundedRectangle with a exclamation mark image on top of it.
	private var errorView: some View {
		RoundedRectangle(cornerRadius: 4)
			.frame(width: width, height: height)
			.foregroundStyle(.red)
			.overlay {
				Image(systemName: "exclamationmark.triangle")
					.font(.title)
			}
			.overlay(
				RoundedRectangle(cornerRadius: 4)
					.stroke(.gray.opacity(0.4))
			)
	}
	
	/// Displays a ProgressView.
	private var loadingView: some View {
		ProgressView()
			.frame(width: width, height: height)
	}
	
	/// Displays a gray RoundedRectangle.
	private var emptyView: some View {
		RoundedRectangle(cornerRadius: 4)
			.frame(width: width, height: height)
			.foregroundStyle(.gray)
			.overlay(
				RoundedRectangle(cornerRadius: 4)
					.stroke(.gray.opacity(0.4))
			)
	}
}

#Preview {
	MoviePosterView(movie: .init(
		backdropPath: "",
		id: 5,
		originalTitle: "",
		overview: "",
		posterPath: "",
		releaseDate: "",
		title: ""
	), width: 100,
	height: 150
	)
}
