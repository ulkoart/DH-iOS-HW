//
//  ViewController.swift
//  AnimationProgressBar
//
//  Created by user on 20.10.2021.
//

import UIKit

class ViewController: UIViewController {

    private let progressBar: ProgressBar = {
        let progressBar = ProgressBar()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    private let startAnimationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Поехали", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = .init(.systemFont(ofSize: 15, weight: .heavy))
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        button.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        view.addSubview(progressBar)
        NSLayoutConstraint.activate([
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            progressBar.heightAnchor.constraint(equalToConstant: 100),
            progressBar.widthAnchor.constraint(equalToConstant: 250),
        ])

        view.addSubview(startAnimationButton)
        NSLayoutConstraint.activate([
            startAnimationButton.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 8),
            startAnimationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startAnimationButton.heightAnchor.constraint(equalToConstant: 40),
            startAnimationButton.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    @objc func startAnimation() {
        progressBar.startAnimate()
      }
}
