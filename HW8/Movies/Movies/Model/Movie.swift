//
//  Movie.swift
//  Movies
//
//  Created by user on 11.10.2021.
//

import Foundation

struct Movie: Codable {
    let title: String
    let image: String
    let year: Int
    let country: String
    let genre: [String]
    let rating: Double
}
