//
//  MainViewController.swift
//  SigmasMovies
//
//  Created by Sysprobs on 19.05.2023.
//

import UIKit

class MainViewController: UIViewController {


	@IBOutlet weak var tableView: UITableView!

	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	var viewModel: MainViewModel = MainViewModel()

	var cellDataSource: [MovieTableCellViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

		configView()
		bindViewModel()
    }

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		viewModel.getData()
	}

	func configView() {
		self.view.backgroundColor = .systemBackground
		self.title = "Main View"

		setupTableView()

	}

	func bindViewModel() {
		viewModel.isLoading.bind { [weak self] isLoading in
			guard let self = self, let isLoading = isLoading else {
				return
			}
			DispatchQueue.main.async {
				if isLoading {
					self.activityIndicator.startAnimating()
				} else {
					self.activityIndicator.stopAnimating()
					self.activityIndicator.isHidden = true
				}
			}
		}

		viewModel.cellDataSource.bind { [weak self] movies in
			guard let self = self, let movies = movies else {
				return
			}
			self.cellDataSource = movies
			self.reloadTableView()
		}
	}

	func openDetail(movieId: Int) {
		guard let movie = viewModel.retriveMovie(with: movieId) else {
			return
		}
		let detailsViewModel = DetailsMovieViewModel(movie: movie)
		let detailsController = DetailsMovieViewConroller(viewModel: detailsViewModel)
		DispatchQueue.main.async {
			self.navigationController?.pushViewController(detailsController, animated: true)
		}
	}

}
