//
//  MovieViewModel.swift
//  MoviesAPI
//
//  Created by Tekla on 11/19/23.
//

import Foundation

protocol  MovieViewModelDelegate: AnyObject {
    func movieFetched(_ movies: [MovieInfo])
    func showeError(_ error: Error)
}

final class MovieViewModel {
    private var movies: [MovieInfo]?
    
    weak var delegate: MovieViewModelDelegate?
    
    func viewDidLoad() {
        fetchMovies()
    }
    
    private func fetchMovies() {
        NetworkManager.shared.fetchMovies { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                self?.delegate?.movieFetched(movies)
            case .failure(_):
            break
            }
        }
    }
}
