//
//  MovieScrollerView.swift
//  MovieDatabase
//
//  Created by Nathan Ubeda on 12/2/24.
//

import SwiftUI

/// Displays a ScrollView
struct MovieScrollView: View {
	let movies: [Movie]
	
	var body: some View {
		ScrollView(.horizontal) {
			HStack {
				ForEach(movies) { movie in
					NavigationLink {
						MovieDetailView(movie: movie)
					} label: {
						MoviePosterView(movie: movie, width: 80, height: 120)
					}
				}
			}
		}
	}
}
