//
//  RecommendationCell.swift
//  Movies
//
//  Created by user on 17.10.2021.
//

import UIKit

class RecommendationCell: UITableViewCell {
    
    static let reuseIdentifier: String = "recommendationCell"
    
    private let movieImage: UIImageView = {
        let iv = UIImageView()
        if let image = UIImage(named: "placeholder") {
            iv.image = image
        }
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 18, weight: .light))
        label.textColor = .init(white: 0.3, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    func configure(with recommendation: Recommendation) {
        self.titleLabel.text = recommendation.title
        if let image = UIImage(named: recommendation.image) {
            movieImage.image = image
        }
    }
    
    private func setupUI() {
        addSubview(movieImage)
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            movieImage.widthAnchor.constraint(equalToConstant: 70),
            movieImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
        
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
