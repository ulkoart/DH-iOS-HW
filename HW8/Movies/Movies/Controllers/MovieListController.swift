//
//  ViewController.swift
//  Movies
//
//  Created by user on 11.10.2021.
//

import UIKit

final class MovieListController: UIViewController {
    
    private let movieCollectionController = MovieCollectionController()
    private let movieDetailController = MovieDetailController()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // stackView.alignment = .fill
        // stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieCollectionController.delegate = self
        setupUI()
    }
    
    private func setupUI() {
        title = "Боевики 90х"
        view.backgroundColor = .white
        
        // MARK: - setup mainStackView
        view.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        movieCollectionController.view.translatesAutoresizingMaskIntoConstraints = false
        movieCollectionController.view.heightAnchor.constraint(equalToConstant: view.frame.height * 0.3).isActive = true
        
        addChild(child: movieCollectionController, toParentStackView: mainStackView)
        addChild(child: movieDetailController, toParentStackView: mainStackView)
    }
    
    private func addChild(child: UIViewController, toParentStackView parent: UIStackView) {
        addChild(child)
        parent.addArrangedSubview(child.view)
        child.didMove(toParent: self)
    }
    
    private func removeChild(child: UIViewController, fromParentStackView parent: UIStackView) {
        child.willMove(toParent: nil)
        parent.removeArrangedSubview(child.view)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}

extension MovieListController: MovieCollectionDelegate {
    func didSelectMovie(_ movie: Movie) {
        movieDetailController.movie = movie
    }
}
