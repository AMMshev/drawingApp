//
//  ChoisingColorCollectionViewCell.swift
//  testTask
//
//  Created by Artem Manyshev on 24.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class ChoisingColorCollectionViewCell: UICollectionViewCell {
    
    let colorNumerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 14)
        return label
    }()
    var partOfColoredSegments: CGFloat = 0 {
        didSet { setNeedsDisplay() }
    }
    var segmentColor: Constants.DrawingColorNames?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(colorNumerLabel)
        NSLayoutConstraint.activate([
            colorNumerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            colorNumerLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        backgroundColor = .white
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let lineWidth = CGFloat(2.0)
        let newRect = CGRect(x: rect.minX + lineWidth / 2.0, y: rect.minY + lineWidth / 2.0,
                             width: rect.maxX - lineWidth, height: rect.maxY - lineWidth)
        let circlePath = UIBezierPath(ovalIn: newRect)
        circlePath.lineWidth = lineWidth
        UIColor(named: segmentColor?.rawValue ?? "red")?.setFill()
        circlePath.fill()
        
        let x = (rect.maxX - rect.minX) / 2.0
        let y = (rect.maxY - rect.minY) / 2.0
        let center = CGPoint(x: rect.minX + x, y: rect.minY + y)
        let radius = max(x, y) - lineWidth / 2.0
        let startAngle: CGFloat = -.pi / 2.0 + .pi * partOfColoredSegments * 2.0
        let endAngle: CGFloat = -.pi / 2.0
        let outlinePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        UIColor.black.setStroke()
        outlinePath.lineWidth = lineWidth
        outlinePath.stroke()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
