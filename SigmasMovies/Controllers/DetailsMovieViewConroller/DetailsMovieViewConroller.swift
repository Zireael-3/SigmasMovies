//
//  DetailsMovieViewConroller.swift
//  SigmasMovies
//
//  Created by Sysprobs on 27.05.2023.
//

import UIKit
import SDWebImage

class DetailsMovieViewConroller: UIViewController {

	//IBOutlets
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	//ViewModel
	var viewModel: DetailsMovieViewModel

	init(viewModel: DetailsMovieViewModel) {
		self.viewModel = viewModel
		super.init(nibName: "DetailsMovieViewConroller", bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

		configView()
		// Do any additional setup after loading the view.
	}

	func configView() {
		self.title = "Movie Details"
		titleLabel.text = viewModel.movieTitle
		descriptionLabel.text = viewModel.movieDescription
		imageView.sd_setImage(with: viewModel.movieImage)
	}
}
