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
        label.font = .init(.systemFont(ofSize: 24, weight: .heavy))
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private var movieRatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 22, weight: .bold))
        label.textColor = UIColor.deepGreen
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
    
    private var countryLabel: UILabel = {
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
    
    private var genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.textColor = .init(white: 0.6, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.text = "Жанр"
        return label
    }()
    
    private var genreValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.textColor = .init(white: 0.3, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private var directorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.textColor = .init(white: 0.6, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.text = "Режиссер"
        return label
    }()
    
    private var directorValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.textColor = .init(white: 0.3, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private var movieOperatorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.textColor = .init(white: 0.6, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.text = "Оператор"
        return label
    }()
    
    private var movieOperatorValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.textColor = .init(white: 0.3, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private var budgetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.textColor = .init(white: 0.6, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.text = "Бюджет"
        return label
    }()
    
    private var budgetValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.textColor = .init(white: 0.3, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private var worldwideFeesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.textColor = .init(white: 0.6, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.text = "Сборы в мире"
        return label
    }()
    
    private var worldwideFeesValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.textColor = .init(white: 0.3, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private var worldPremiereLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.textColor = .init(white: 0.6, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.text = "Премьера в мире"
        return label
    }()
    
    private var worldPremiereValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(.systemFont(ofSize: 14, weight: .light))
        label.textColor = .init(white: 0.3, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private let recommendationsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Посмотреть рекомендации", for: .normal)
        button.setTitleColor(UIColor(white: 0.3, alpha: 1), for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = .init(.systemFont(ofSize: 15, weight: .heavy))
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(white: 0.6, alpha: 1).cgColor
        button.addTarget(self, action: #selector(showPecommendations), for: .touchUpInside)
        return button
    }()
    
    var movie: Movie? {
        didSet {
            if let movie = movie {
                self.movieTitleLabel.text = movie.title
                self.yearValueLabel.text = "\(movie.year)"
                self.countryValueLabel.text = movie.country
                self.movieRatingLabel.text = "\(movie.rating)"
                self.genreValueLabel.text = movie.genre.map({$0}).joined(separator: ",")
                
                self.directorValueLabel.text = movie.director
                self.movieOperatorValueLabel.text = movie.movieOperator
                self.budgetValueLabel.text = movie.budget
                self.worldwideFeesValueLabel.text = movie.worldwideFees
                self.worldPremiereValueLabel.text = movie.worldPremiere
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
            movieTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8)
        ])

        view.addSubview(movieRatingLabel)
        NSLayoutConstraint.activate([
            movieRatingLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor),
            movieRatingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            movieRatingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8),
        ])

        view.addSubview(movieInfoStackView)
        NSLayoutConstraint.activate([
            movieInfoStackView.topAnchor.constraint(equalTo: movieRatingLabel.bottomAnchor, constant: 8),
            movieInfoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            movieInfoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            movieInfoStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
        ])

        let labelsStackView = UIStackView(arrangedSubviews: [yearLabel, countryLabel, genreLabel, directorLabel, movieOperatorLabel, budgetLabel, worldwideFeesLabel, worldPremiereLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 4
        movieInfoStackView.addArrangedSubview(labelsStackView)

        let infoStackView = UIStackView(arrangedSubviews: [yearValueLabel, countryValueLabel, genreValueLabel, directorValueLabel, movieOperatorValueLabel, budgetValueLabel, worldwideFeesValueLabel, worldPremiereValueLabel])
        infoStackView.axis = .vertical
        infoStackView.spacing = 4
        infoStackView.alignment = .trailing
        movieInfoStackView.addArrangedSubview(infoStackView)
        
        view.addSubview(recommendationsButton)
        recommendationsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        recommendationsButton.topAnchor.constraint(equalTo: movieInfoStackView.bottomAnchor, constant: 16).isActive = true
        recommendationsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        recommendationsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
     @objc private func showPecommendations() {
        let recommendationsController = RecommendationsController()
        recommendationsController.configure(with: movie?.recommendations ?? [])
        self.navigationController?.pushViewController(recommendationsController, animated: true)
    }
}
