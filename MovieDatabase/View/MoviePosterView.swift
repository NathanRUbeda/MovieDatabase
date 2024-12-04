//
//  MoviePosterView.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/4/24.
//

import SwiftUI

struct MoviePosterView: View {
	let movie: Movie
	
    var body: some View {
		if let poster = movie.posterPath {
			AsyncImage(url: URL(string: poster)) { phase in
				if let image = phase.image {
					image
						.resizable()
						.frame(width: 100, height: 200)
						.scaledToFill()
						.clipShape(
							RoundedRectangle(cornerRadius: 10)
						)
				} else if phase.error != nil {
					RoundedRectangle(cornerRadius: 10)
						.frame(width: 100, height: 200)
						.foregroundStyle(.red)
						.overlay {
							Image(systemName: "exclamationmark.triangle")
								.font(.title)
						}
				} else {
					ProgressView()
						.frame(width: 100, height: 200)
				}
			}
		} else {
			RoundedRectangle(cornerRadius: 10)
				.frame(width: 100, height: 200)
				.foregroundStyle(.gray)
				.overlay {
					Text("No available poster.")
				}
		}
    }
}

#Preview {
	MoviePosterView(movie: .init(
		id: 5,
		originalTitle: "",
		overview: "",
		posterPath: "",
		releaseDate: "",
		title: ""
	))
}
