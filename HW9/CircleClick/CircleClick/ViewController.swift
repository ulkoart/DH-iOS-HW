//
//  ViewController.swift
//  CircleClick
//
//  Created by user on 18.10.2021.
//

import UIKit

class MyButton: UIButton {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return bounds.insetBy(dx: -20, dy: -20).contains(point)
    }
}

class Circle: UIView {
    
    private var cutPath: CGPath?
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let center = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        let result = pow(center.x-point.x, 2) + pow(center.y - point.y, 2) <= pow(bounds.size.width/2, 2)
        
        guard let cutPath = cutPath else { return result }
        guard cutPath.contains(point) else { return result }
        
        return false
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = bounds.height / 2
    }
    
    func cutHole() {
        let center = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        let circlePath = UIBezierPath(ovalIn: CGRect(x: center.x / 2, y: center.y/2, width: self.bounds.width/2, height: self.bounds.height/2))
        let path = UIBezierPath(rect: self.bounds)
        path.append(circlePath)
        
        let maskLayer = CAShapeLayer()
        maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
        maskLayer.path = path.cgPath
        
        self.layer.mask = maskLayer
        self.cutPath = circlePath.cgPath
    }
}

class ViewController: UIViewController {
    
    private let clickButton: UIButton = {
        let button = MyButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("clickButton", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = .init(.systemFont(ofSize: 15, weight: .heavy))
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(clickButtonAction), for: .touchUpInside)
        return button
    }()
    
    let viewA: Circle = {
        let view = Circle()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.4006300867, green: 0.6978033781, blue: 1, alpha: 1)
        view.clipsToBounds = true
        return view
    }()
    
    let viewB: Circle = {
        let view = Circle()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9968919158, green: 1, blue: 0.6010217071, alpha: 1)
        view.clipsToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let gestureA = UITapGestureRecognizer(target: self, action:  #selector(self.touchViewA))
        viewA.addGestureRecognizer(gestureA)
        
        view.addSubview(viewA)
        NSLayoutConstraint.activate([
            viewA.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewA.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewA.heightAnchor.constraint(equalToConstant: 250),
            viewA.widthAnchor.constraint(equalToConstant: 250),
        ])
        
        
        let gestureB = UITapGestureRecognizer(target: self, action:  #selector(self.touchViewB))
        viewB.addGestureRecognizer(gestureB)
        
        view.addSubview(viewB)
        NSLayoutConstraint.activate([
            viewB.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewB.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewB.heightAnchor.constraint(equalToConstant: 150),
            viewB.widthAnchor.constraint(equalToConstant: 150),
        ])
        
        view.addSubview(clickButton)
        NSLayoutConstraint.activate([
            clickButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            clickButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            clickButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            clickButton.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    @objc func touchViewA(sender : UITapGestureRecognizer) {
        print(#function)
    }
    
    @objc func touchViewB(sender : UITapGestureRecognizer) {
        print(#function)
    }
    
    @objc func clickButtonAction() {
        print(#function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewB.cutHole()
    }
}
