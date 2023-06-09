//
//  DetailsMovieViemModel.swift
//  SigmasMovies
//
//  Created by Sysprobs on 28.05.2023.
//

import Foundation

class DetailsMovieViewModel {

	var movie: Movie

	var movieImage: URL?
	var movieTitle:	String
	var movieDescription:String
	var movieId: Int

	init(movie: Movie) {
		self.movie = movie

		self.movieId = movie.id
		self.movieTitle = movie.name ?? movie.alternativeName ?? ""
		self.movieDescription = movie.description
		if let posterUrl = movie.poster["url"] {
			self.movieImage = makeImageURL(posterUrl)
		} else if let posterUrl = movie.poster["previewUrl"] {
			self.movieImage = makeImageURL(posterUrl)
		}
	}
		private func makeImageURL(_ imageCode: String) -> URL? {
			URL(string: "\(imageCode)")
	 }
}
