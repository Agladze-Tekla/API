//
//  MovieCollection.swift
//  anything
//
//  Created by Tekla on 11/3/23.
//

import UIKit

struct MovieResults: Decodable {
    let results: [MovieInfo]
}

struct MovieInfo: Decodable {
    let id: Int
    let title: String
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
    }
}
