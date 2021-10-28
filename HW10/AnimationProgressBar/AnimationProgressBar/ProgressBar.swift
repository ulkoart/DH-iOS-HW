//
//  ProgressBar.swift
//  AnimationProgressBar
//
//  Created by user on 20.10.2021.
//

import UIKit

class ProgressBar: UIView {
    
    var redTriangleLayer: CAShapeLayer?
    var whiteTriangleLayer: CAShapeLayer?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawWhiteTriangle()
        drawRedTriangle()
    }
    
    private func drawWhiteTriangle() {
        let whiteTrianglePath = UIBezierPath()
        whiteTrianglePath.move(to: bounds.origin)
        whiteTrianglePath.addLine(to: CGPoint(x: bounds.maxX, y: bounds.origin.y))
        whiteTrianglePath.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        whiteTrianglePath.addLine(to: CGPoint(x: bounds.origin.x, y: bounds.maxY))
        whiteTrianglePath.addLine(to: CGPoint(x: bounds.origin.x, y: bounds.origin.y))
        
        whiteTriangleLayer = CAShapeLayer()
        whiteTriangleLayer?.path = whiteTrianglePath.cgPath
        whiteTriangleLayer?.fillColor = UIColor.white.cgColor
        
        if let whiteTriangleLayer = whiteTriangleLayer {
            self.layer.addSublayer(whiteTriangleLayer)
        }
    }
    
    private func drawRedTriangle() {
        let redTrianglePath = UIBezierPath()
        redTrianglePath.move(to: bounds.origin)
        redTrianglePath.addLine(to: CGPoint(x: 0, y: bounds.origin.y))
        redTrianglePath.addLine(to: CGPoint(x: 0, y: bounds.maxY))
        redTrianglePath.addLine(to: CGPoint(x: bounds.origin.x, y: bounds.maxY - 10))
        redTrianglePath.addLine(to: CGPoint(x: bounds.origin.x, y: bounds.origin.y))
        
        redTriangleLayer = CAShapeLayer()
        redTriangleLayer?.path = redTrianglePath.cgPath
        redTriangleLayer?.fillColor = UIColor.systemRed.cgColor

        if let redTriangleLayer = redTriangleLayer {
            self.layer.addSublayer(redTriangleLayer)
        }
        
    }
    
    func startAnimate() {
        guard let redTriangleLayer = redTriangleLayer else { return }
        
        CATransaction.begin()
        let animation = CABasicAnimation(keyPath: "path")
        animation.duration = 5
        animation.toValue = whiteTriangleLayer?.path
        
        CATransaction.setCompletionBlock{ [weak self] in
            self?.redTriangleLayer?.path = self?.whiteTriangleLayer?.path
        }
        
        redTriangleLayer.add(animation, forKey: "path")
        CATransaction.commit()
        
    }
}
