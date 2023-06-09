//
//  MainShowCell.swift
//  SigmasMovies
//
//  Created by Sysprobs on 25.05.2023.
//

import UIKit
import SDWebImage

class MainShowCell: UITableViewCell {

	public static var identifier: String {
		get {
			return "MainShowCell"
		}
	}

	public static func register() -> UINib {
		UINib(nibName: "MainShowCell", bundle: nil)
	}

	//IBoutlets:

	@IBOutlet weak var backView: UIView!

	@IBOutlet weak var movieImageView: UIImageView!

	@IBOutlet weak var nameLabel: UILabel!


	@IBOutlet weak var typeLabel: UILabel!

	@IBOutlet weak var dateLabel: UILabel!
	
	@IBOutlet weak var rateLabel: UILabel!
	
	/*
	@IBOutlet weak var backView: UIView!
	@IBOutlet weak var movieImageView: UIImageView!
	
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var rateLabel: UILabel!
	 */
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		backView.addBorder(color: .label, width: 0)
		backView.round()
		backView.backgroundColor = .systemBackground

		movieImageView.round(2)
    }

	func setupCell(viewModel: MovieTableCellViewModel) {
		self.nameLabel.text = viewModel.title
		self.typeLabel.text = viewModel.type
		self.dateLabel.text = viewModel.date
		self.rateLabel.text = viewModel.rating
		self.movieImageView.sd_setImage(with: viewModel.imageUrl)
	}
    
}
