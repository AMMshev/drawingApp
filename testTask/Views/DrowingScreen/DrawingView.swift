//
//  Custom.swift
//  testTask
//
//  Created by Artem Manyshev on 23.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class DrawingView: UIView {
    
    fileprivate let imageView = UIImageView(image: UIImage(named: "backgroundImage"))
    fileprivate var grayColorPathsArray: [UIBezierPath] = []
    fileprivate var lightblueColorPathsArray: [UIBezierPath] = []
    fileprivate var greenColorPathsArray: [UIBezierPath] = []
    fileprivate var brownColorPathsArray: [UIBezierPath] = []
    fileprivate var blueColorPathsArray: [UIBezierPath] = []
    fileprivate var redColorPathsArray: [UIBezierPath] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        var fillColor = UIColor(named: Constants.DrawingColorNames.gray.rawValue)
        fillColor?.setFill()
        grayColorPathsArray.forEach({$0.fill()})
        fillColor = UIColor(named: Constants.DrawingColorNames.lightBlue.rawValue)
        fillColor?.setFill()
        lightblueColorPathsArray.forEach({$0.fill()})
        fillColor = UIColor(named: Constants.DrawingColorNames.green.rawValue)
        fillColor?.setFill()
        greenColorPathsArray.forEach({$0.fill()})
        fillColor = UIColor(named: Constants.DrawingColorNames.brown.rawValue)
        fillColor?.setFill()
        brownColorPathsArray.forEach({$0.fill()})
        fillColor = UIColor(named: Constants.DrawingColorNames.blue.rawValue)
        fillColor?.setFill()
        blueColorPathsArray.forEach({$0.fill()})
        fillColor = UIColor(named: Constants.DrawingColorNames.red.rawValue)
        fillColor?.setFill()
        redColorPathsArray.forEach({$0.fill()})
    }
    
    func countOfSegmentsArray(with color: Constants.DrawingColorNames) -> Int {
        switch color {
        case .gray:
            return grayColorPathsArray.count
        case .lightBlue:
            return lightblueColorPathsArray.count
        case .green:
            return greenColorPathsArray.count
        case .brown:
            return brownColorPathsArray.count
        case .blue:
            return blueColorPathsArray.count
        case .red:
            return redColorPathsArray.count
        }
    }
    
    func checkIsSegmentColoredAndAdd(segment: UIBezierPath, with color: Constants.DrawingColorNames) {
        switch color {
        case .gray:
            if !grayColorPathsArray.contains(segment) { grayColorPathsArray.append(segment) }
        case .lightBlue:
            if !lightblueColorPathsArray.contains(segment) { lightblueColorPathsArray.append(segment) }
        case .green:
            if !greenColorPathsArray.contains(segment) { greenColorPathsArray.append(segment) }
        case .brown:
            if !brownColorPathsArray.contains(segment) { brownColorPathsArray.append(segment) }
        case .blue:
            if !blueColorPathsArray.contains(segment) { blueColorPathsArray.append(segment) }
        case .red:
            if !redColorPathsArray.contains(segment) { redColorPathsArray.append(segment) }
        }
        setNeedsDisplay()
    }
    func fillAllSegments(of color: Constants.DrawingColorNames, segments: [() -> UIBezierPath]) {
        switch color {
        case .gray:
            grayColorPathsArray.removeAll()
            segments.forEach({grayColorPathsArray.append($0())})
        case .lightBlue:
            lightblueColorPathsArray.removeAll()
            segments.forEach({lightblueColorPathsArray.append($0())})
        case .green:
            greenColorPathsArray.removeAll()
            segments.forEach({greenColorPathsArray.append($0())})
        case .brown:
            brownColorPathsArray.removeAll()
            segments.forEach({brownColorPathsArray.append($0())})
        case .blue:
            blueColorPathsArray.removeAll()
            segments.forEach({blueColorPathsArray.append($0())})
        case .red:
            redColorPathsArray.removeAll()
            segments.forEach({redColorPathsArray.append($0())})
        }
        setNeedsDisplay()
    }
}
