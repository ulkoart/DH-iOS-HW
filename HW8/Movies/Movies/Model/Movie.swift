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
    
    let director: String
    let movieOperator: String
    let budget: String
    let worldwideFees: String
    let worldPremiere: String
    let recommendations: [Recommendation]
}

struct Recommendation: Codable {
    let title: String
    let image: String
}
