//
//  MovieTableCellViewModel.swift
//  SigmasMovies
//
//  Created by Sysprobs on 25.05.2023.
//

import Foundation

class MovieTableCellViewModel {
	var id: Int
	var title: String
	var date: String
	var rating: String
	var type: String
	var imageUrl: URL?

	init(movie: Movie) {
		self.id = movie.id
		self.title = movie.alternativeName ?? movie.name
		self.rating = "Rating: \(movie.rating.kp!) / 10.00"
		self.date = "Year: \(movie.year)"
		self.type = "\(movie.type)"
		if let posterUrl = movie.poster["url"] {
				self.imageUrl = makeImageUrl(posterUrl)
		} else if let posterUrl = movie.poster["previewUrl"] {
			self.imageUrl = makeImageUrl(posterUrl)
		}
	}

	private func makeImageUrl(_ imageCode: String) -> URL? {
		URL(string: "\(imageCode)")
	}
}
