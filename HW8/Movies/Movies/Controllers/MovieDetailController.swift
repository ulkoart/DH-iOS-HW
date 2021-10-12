//
//  MovieDetailController.swift
//  Movies
//
//  Created by user on 12.10.2021.
//

import UIKit

class MovieDetailController: UIViewController {
    
    private let movieInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    private var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 28, weight: .heavy))
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private var yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .init(white: 0.6, alpha: 1)
        label.text = "Год производства"
        return label
    }()
    
    private var yearLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .init(white: 0.6, alpha: 1)
        label.text = "Страна"
        return label
    }()
    
    private var yearValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.textColor = .init(white: 0.3, alpha: 1)
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private var countryValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.textColor = .init(white: 0.3, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    var movie: Movie? {
        didSet {
            if let movie = movie {
                self.movieTitleLabel.text = movie.title
                self.yearValueLabel.text = "\(movie.year)"
                self.countryValueLabel.text = movie.country
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(white: 0.9, alpha: 1)
        setupUI()
    }
    
    private func setupUI () {
        let path = UIBezierPath(roundedRect: self.view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 40, height: 40))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.view.bounds
        maskLayer.path = path.cgPath
        self.view.layer.mask = maskLayer
        
        view.addSubview(movieTitleLabel)
        NSLayoutConstraint.activate([
            movieTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            movieTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            movieTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8),
            movieTitleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/6)
        ])
        
        view.addSubview(movieInfoStackView)
        NSLayoutConstraint.activate([
            movieInfoStackView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor),
            movieInfoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            movieInfoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            movieInfoStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        let labelsStackView = UIStackView(arrangedSubviews: [yearLabel, yearLabel2])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 4
        movieInfoStackView.addArrangedSubview(labelsStackView)
        
        let infoStackView = UIStackView(arrangedSubviews: [yearValueLabel, countryValueLabel])
        infoStackView.axis = .vertical
        infoStackView.spacing = 4
        infoStackView.alignment = .trailing
        movieInfoStackView.addArrangedSubview(infoStackView)

    }
    
}
