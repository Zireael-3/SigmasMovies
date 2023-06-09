//
//  APICaller.swift
//  SigmasMovies
//
//  Created by Sysprobs on 22.05.2023.
//

import Foundation
/*
enum NetworkError: Error {
	case urlError
	case canNotParseData
}
 */

public class APICaller {
/*
	static func getSigmaMovies(
		completionHandler: @escaping (_ result:  Result<SigmaMovieModel,Error>) -> Void) {

			let urlString = 	"https://api.kinopoisk.dev/v1/"

			guard let url = URL(string: urlString) else {
				completionHandler(.failure(NetworkError.urlError))
				return
			}

			URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in

					if error == nil,
					   let data = dataResponse,
					   let resultData = try? JSONDecoder().decode(SigmaMovieModel.self, from: data) {
						completionHandler(.success(resultData))
					} else {
						completionHandler(.failure(NetworkError.canNotParseData))
					}
			}.resume()

*/

			 enum NetworkError: Error {
				 case invalidUrl
				 case invalidResponse
			 }

	static func getSigmaMovies(by genres: [String], type1: TypeEnum = .movie, type2: TypeEnum = .tvSeries, page: Int = 1, limit: Int = 800, completion: @escaping (Result<SigmaMovieModel, Error>) -> Void) {

			 var components = URLComponents(string: "https://api.kinopoisk.dev/v1/movie")!
				 components.queryItems = [
					 URLQueryItem(name: "genres.name", value: genres[0]),
					 URLQueryItem(name: "genres.name", value: genres[1]),
					 URLQueryItem(name: "genres.name", value: genres[2]),
					 URLQueryItem(name: "genres.name", value: genres[3]),
					 URLQueryItem(name: "type", value: type1.rawValue),
					 URLQueryItem(name: "type", value: type2.rawValue),
					 URLQueryItem(name: "limit", value: String(limit)),
					 URLQueryItem(name: "page", value: String(page))
				 ]

				 guard let url = components.url else {
					 completion(.failure(NetworkError.invalidUrl))
					 return
				 }

				 var request = URLRequest(url: url)
			request.addValue(NetworkConstant.shared.apiKey, forHTTPHeaderField: "X-API-KEY")

				 URLSession.shared.dataTask(with: request) { data, response, error in

					 guard let data = data, let response = response as? HTTPURLResponse, error == nil, response.statusCode == 200 else {
						 completion(.failure(NetworkError.invalidResponse))
						 return
					 }
					 do {
						 let decoder = JSONDecoder()
						 let moviesResponse = try decoder.decode(SigmaMovieModel.self, from: data)
						 completion(.success(moviesResponse))
					 } catch {
						 completion(.failure(error))
					 }
				 }.resume()

		
	}

}
