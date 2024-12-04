//
//  MovieDetailView.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 11/4/24.
//

import SwiftUI

struct MovieDetailView: View {
	let movie: Movie
	
    var body: some View {
		VStack(alignment: .leading) {
			HStack {
				VStack {
					Text(movie.title)
						.font(.title)
						.fontWeight(.semibold)
					
					HStack {
						Text(movie.releaseDate)
					}
					.font(.subheadline)
				}
				
				MoviePosterView(movie: movie)
			}
			
			
			Text(movie.overview)
				.font(.subheadline)
		}
    }
}

#Preview {
	MovieDetailView(
		movie: .init(
			id: 5,
			originalTitle: "",
			overview: "",
			posterPath: "",
			releaseDate: "",
			title: ""
		)
	)
}
