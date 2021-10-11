//
//  MovieService.swift
//  Movies
//
//  Created by user on 11.10.2021.
//

import Foundation

class MovieService {
    
    static let shared: MovieService = MovieService()
    private init() {}

    func getMovies(completion: @escaping ([Movie]?) -> Void) {
        guard
            let url = Bundle.main.url(forResource: "movies", withExtension: "json"),
            let data = try? Data(contentsOf: url)
        else {
            completion(nil)
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let movies = try decoder.decode([Movie].self, from: data)
            completion(movies)
        } catch { fatalError("decode movies - failed") }
    }
}
