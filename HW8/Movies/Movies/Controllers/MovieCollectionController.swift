//
//  MovieCollectionController.swift
//  Movies
//
//  Created by user on 11.10.2021.
//

import UIKit

protocol MovieCollectionDelegate: AnyObject {
    func didSelectMovie(_ movie: Movie)
}

final class MovieCollectionController: UICollectionViewController {
    
    weak var delegate: MovieCollectionDelegate?
    
    
    private var movies = [Movie]() {
        didSet {
            guard
                !movies.isEmpty,
                let movie = movies.first
            else { return }
            delegate?.didSelectMovie(movie)
        }
    }
    
    lazy var indentValue: CGFloat = {
        return view.frame.width * 0.04
    }()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        
        // collectionView.delegate = self
        // collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
        
        MovieService.shared.getMovies() { [weak self] movies in
            guard let movies = movies else { return }
            self?.movies = movies
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
        let movie = movies[indexPath.item]
        cell.configure(with: movie)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.item]
        delegate?.didSelectMovie(movie)
    }
    
}

extension MovieCollectionController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width * 0.3, height: view.frame.height - indentValue * 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: indentValue, left: indentValue, bottom: indentValue, right: indentValue)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return indentValue
    }
}
