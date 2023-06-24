//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Elizeu RS on 15/06/23.
//

// https://api.themoviedb.org/3/movie/upcoming?api_key=e0330d7c6c649fe9f0325ddea7eeae4f&language=en-US&page=1"

import Foundation
// https://api.themoviedb.org/3/movie/upcoming?api_key=e0330d7c6c649fe9f0325ddea7eeae4f
// https://api.themoviedb.org/3/trending/movie/day?api_key=e0330d7c6c649fe9f0325ddea7eeae4f

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
  func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
    guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else { return }
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        //      let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
        //      print(results)
        
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
        //      print(results)
        //      print(results.results[0].original_title)
        
      } catch {
//        completion(.failure(error))
        completion(.failure(APIError.failedToGetData))
//        print(error.localizedDescription)
      }
    }
    
    task.resume()
  }
  
  //  func getTrendingTvs(completion: @escaping (Result<[String], Error>) -> Void) {
  func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
    guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else { return }
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        //        let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
//        print(results)
      } catch {
        completion(.failure(APIError.failedToGetData))
//        print(error.localizedDescription)
      }
    }
    task.resume()
  }
  
  //https://api.themoviedb.org/3/movie/upcoming?api_key<<api_key>>&language=en-US&page=1
  
  func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
    guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
        print(results)
      } catch  {
        completion(.failure(APIError.failedToGetData))
//        print(error.localizedDescription)
      }
    }
    task.resume()
  }
  
  func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
    guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
        print(results)
      } catch  {
//        print(error.localizedDescription)
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }
  
  func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
    guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
        print(results)
      } catch  {
//        print(error.localizedDescription)
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }
  
  func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
    
    //https://api.themoviedb.org/3/discover/movie?api_key=YOUR_API_KEY&language=en-US&sort_by=popularity.desc&page
    
    guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&page=1") else { return }

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
        print(results)
      } catch  {
//        print(error.localizedDescription)
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }
  
  func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
    
    // https://api.themoviedb.org/3/search/movie?query=Jack+Reacher&api_key=API_KEY
    // https://api.themoviedb.org/3/search/movie?query=Jack+Reacher&api_key=e0330d7c6c649fe9f0325ddea7eeae4f
    
    // https://api.themoviedb.org/3/search/movie?query=Jack+Reacher&api_key=e0330d7c6c649fe9f0325ddea7eeae4f

    
    guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
    guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?query=\(query)&api_key=\(Constants.API_KEY)") else { return }
    
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
        completion(.success(results.results))
        print(results)
      } catch  {
//        print(error.localizedDescription)
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }
  
}
