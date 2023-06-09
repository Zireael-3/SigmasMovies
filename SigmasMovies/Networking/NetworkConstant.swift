//
//  NetworkConstant.swift
//  SigmasMovies
//
//  Created by Sysprobs on 22.05.2023.
//

import Foundation

class NetworkConstant {

	public static var shared: NetworkConstant = NetworkConstant()

	private init() {
		// Singletone
	}

	public var apiKey: String {
		get {
			//API key from //https://kinopoisk.dev/
			return "86K9CED-HWRMTM6-JE2A8CT-X822DXY"
		}
	}

	public var serverAddress: String {
		get {
			return "https://api.kinopoisk.dev/v1/movie"
		}
	}

	public var imageServerAddress: String {
		get {
			return "https://st.kp.yandex.net/images/film_big/"
		}
	}

}
