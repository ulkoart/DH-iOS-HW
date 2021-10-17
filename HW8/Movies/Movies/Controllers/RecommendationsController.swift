//
//  RecommendationsController.swift
//  Movies
//
//  Created by user on 17.10.2021.
//

import UIKit

class RecommendationsController: UIViewController {
    
    var recommendations: [Recommendation] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // or .zero
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RecommendationCell.self, forCellReuseIdentifier: RecommendationCell.reuseIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupUI()
    }
    
    private func setupDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupUI () {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func configure(with recommendations: [Recommendation]) {
        self.recommendations = recommendations
    }
}

extension RecommendationsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommendations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommendationCell.reuseIdentifier, for: indexPath) as? RecommendationCell else { fatalError() }
        let recommendation = recommendations[indexPath.row]
        cell.configure(with: recommendation)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
