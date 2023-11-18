//
//  MoviesManager.swift
//  MoviesAPI
//
//  Created by Tekla on 11/11/23.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()

    private let baseURL = "https://www.omdbapi.com/"
    private let apiKey =  "6c128d28"
   
    private init() {}
    
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let urlStr = "\(baseURL)\(Movie.CodingKeys.request)apikey=\(apiKey)"//"\(baseURL)?apikey=\(apiKey)" //"http://www.omdbapi.com/?i=tt3896198&apikey=6c128d28"
        guard let url = URL(string: urlStr) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
                     do {
                         let moviesResponse = try JSONDecoder().decode(MoviesResponse.self, from: data)
                         completion(.success(moviesResponse.results))
                     } catch {
                        completion(.failure(error))
                     }
        }.resume()
    }
    }
