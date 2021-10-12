//
//  MovieCollectionViewCell.swift
//  Movies
//
//  Created by user on 12.10.2021.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let iv = UIImageView()

        if let image = UIImage(named: "placeholder") {
            iv.image = image
        }
    
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 3
        self.layer.shadowRadius = 7
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3, height: 5)
        self.clipsToBounds = false
    }
    
    func configure(with movie: Movie) {
        guard let image = UIImage(named: movie.image) else { return }
        imageView.image = image
    }
}
