//
//  ViewController.swift
//  Movies
//
//  Created by user on 11.10.2021.
//

import UIKit

class MovieListController: UIViewController {
    
    private let movieCollectionController = MovieCollectionController()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Фильмы"
        view.backgroundColor = .white
        
        movieCollectionController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(movieCollectionController.view)
        
        NSLayoutConstraint.activate([
            movieCollectionController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieCollectionController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieCollectionController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieCollectionController.view.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/3)
        ])
    }
}

