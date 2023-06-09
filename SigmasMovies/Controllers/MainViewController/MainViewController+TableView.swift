//
//  MainViewController+TableView.swift
//  SigmasMovies
//
//  Created by Sysprobs on 20.05.2023.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

	func setupTableView() {
		self.tableView.delegate = self
		self.tableView.dataSource = self

		self.tableView.backgroundColor = .systemBackground

		self.registerCells()
	}

	func registerCells() {
		tableView.register(MainShowCell.register(), forCellReuseIdentifier: MainShowCell.identifier)
	}

	func reloadTableView() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		viewModel.numberOfSections()
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.numberOfRows(in: section)
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: MainShowCell.identifier, for: indexPath) as? MainShowCell else {
			return UITableViewCell()
		}
		let cellViewModel = cellDataSource[indexPath.row]
		cell.setupCell(viewModel: cellViewModel)
		cell.selectionStyle = .none
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
			180
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let movieId = cellDataSource[indexPath.row].id
		self.openDetail(movieId: movieId)
	}


}
