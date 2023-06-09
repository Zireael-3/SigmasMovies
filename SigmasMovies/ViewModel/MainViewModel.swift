//
//  MainViewModel.swift
//  SigmasMovies
//
//  Created by Sysprobs on 21.05.2023.
//

import Foundation

class MainViewModel {

	var isLoading: Observable<Bool> = Observable(false)
	var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
	var dataSource: [Movie]?

	func numberOfSections() -> Int {
		1
	}

	func numberOfRows(in section: Int) -> Int {
		self.dataSource?.count ?? 0
	}

	func getData() {
		if isLoading.value ?? true {
			return
		}

		let genres = ["триллер", "драма", "криминал", "детектив"]
		isLoading.value = true
		APICaller.getSigmaMovies(by: genres) { [weak self] result in
			self?.isLoading.value = false
			switch result {
			case .success(let movies):
				let filteredMovies = movies.docs.filter { movie in
					guard let genres = movie.genres else { return false }
					return genres.contains { $0.name == "драма" } && genres.contains { $0.name == "триллер" } //&& genres.contains { $0.name == "криминал" }
				  }
				print(movies)
				self?.dataSource = filteredMovies.shuffled()
				self?.mapCellData()
			case .failure(let error):
				print(error)
				/*
				 APICaller.getSigmaMovies { result in
				 switch result {
				 case .success(let data):
				 print("Sigma Movies Counts: \(data.count)")
				 case .failure(let error):
				 print(error)
				 }
				 */
			}
		}
	}

	func mapCellData() {
		self.cellDataSource.value = self.dataSource?.compactMap({MovieTableCellViewModel(movie: $0)}) ?? []
	}

	func getMovieTitle(_ movie: Movie) -> String {
		return movie.name ?? movie.alternativeName ?? ""
	}

	func retriveMovie(with id: Int) -> Movie? {
		guard let movie = dataSource?.first(where: {$0.id == id}) else {
			return nil
		}
		return movie
	}
}
