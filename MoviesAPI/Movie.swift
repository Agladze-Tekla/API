//
//  Movie.swift
//  MoviesAPI
//
//  Created by Tekla on 11/17/23.
//

import Foundation

struct MoviesResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let request: String
    let title: String
    let genre: String
    let plot: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case request = "Request"
        case title = "Title"
        case genre = "Genre"
        case plot = "Plot"
        case poster = "Poster"
    }
}
