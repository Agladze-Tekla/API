//
//  MoviesManager.swift
//  MoviesAPI
//
//  Created by Tekla on 11/11/23.
//

import Foundation
/*
let urlString = "https://www.omdbapi.com"

struct MoviesFromAPI: Decodable {
    let movies: [Movie]
}

struct Movie: Decodable {
    let title: String
    let genre: String
    let synopsis: String
}

final class Api {
    func getMovies(completion: @escaping ([MoviesFromAPI]?) -> Void ) {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            if let error = error {
                completion(nil)
                return
            }
            
            do {
                let movies = try JSONDecoder().decode(MoviesFromAPI, from: data)
                
                DispatchQueue.main.async {
                    completion(movies)
                }
            } catch {
             completion(nil)
            }
          
    }
    }
    }
*/
