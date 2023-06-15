//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Elizeu RS on 15/06/23.
//

import Foundation

//https://api.themoviedb.org/3/trending/all/day?api_key=e0330d7c6c649fe9f0325ddea7eeae4f

struct Constants {
  static let API_KEY = "e0330d7c6c649fe9f0325ddea7eeae4f"
  static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
  case failedToGetData
}

class APICaller {
  static let shared = APICaller()
  
//  func getTrendingMovies(completion: @escaping (String) -> Void) {
  func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
    guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else { return }
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
      return
    }
    
    do {
//      let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//      print(results)
      
      let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
      completion(.success(results.results))
//      print(results)
//      print(results.results[0].original_title)
      
    } catch {
      completion(.failure(error))
      print(error.localizedDescription)
    }
  }
  
  task.resume()
}
}
