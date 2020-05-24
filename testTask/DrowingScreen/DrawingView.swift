//
//  Custom.swift
//  testTask
//
//  Created by Artem Manyshev on 23.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class DrawingView: UIView {
    
    let grayLightbluePaths = ColorsPathsGrayLightBlue()
    let greenBrownBlueRedPaths = ColorsPathsGreenBrownBlueRed()
    let imageView = UIImageView(image: UIImage(named: "backgroundImage"))
    
    var grayColorPathsArray: [UIBezierPath] = []
    var lightblueColorPathsArray: [UIBezierPath] = []
    var greenColorPathsArray: [UIBezierPath] = []
    var brownColorPathsArray: [UIBezierPath] = []
    var blueColorPathsArray: [UIBezierPath] = []
    var redColorPathsArray: [UIBezierPath] = []
    
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
        var fillColor = UIColor(named: "gray")
        fillColor?.setFill()
        grayColorPathsArray.forEach({$0.fill()})
        fillColor = UIColor(named: "lightBlue")
        fillColor?.setFill()
        lightblueColorPathsArray.forEach({$0.fill()})
        fillColor = UIColor(named: "green")
        fillColor?.setFill()
        greenColorPathsArray.forEach({$0.fill()})
        fillColor = UIColor(named: "brown")
        fillColor?.setFill()
        brownColorPathsArray.forEach({$0.fill()})
        fillColor = UIColor.blue
        fillColor?.setFill()
        blueColorPathsArray.forEach({$0.fill()})
        fillColor = UIColor(named: "red")
        fillColor?.setFill()
        redColorPathsArray.forEach({$0.fill()})
    }
    
    func fillColor(at point: CGPoint, chosenColor: Constants.DrawingColorNames) {
        switch chosenColor {
        case .gray:
            grayLightbluePaths.grayColorPaths.forEach({
                if !grayColorPathsArray.contains($0()) && $0().contains(point) {
                    grayColorPathsArray.append($0())
                }
            })
        case .lightBlue:
            grayLightbluePaths.lightBlueColorPaths.forEach({
                if !lightblueColorPathsArray.contains($0()) && $0().contains(point) {
                    lightblueColorPathsArray.append($0())
                }
            })
        case .green:
            greenBrownBlueRedPaths.greenColorPaths.forEach({
                if !greenColorPathsArray.contains($0()) && $0().contains(point) {
                    greenColorPathsArray.append($0())
                }
            })
        case .brown:
            greenBrownBlueRedPaths.brownColorPaths.forEach({
                if !brownColorPathsArray.contains($0()) && $0().contains(point) {
                    brownColorPathsArray.append($0())
                }
            })
        case .blue:
            greenBrownBlueRedPaths.blueColorPaths.forEach({
                if !blueColorPathsArray.contains($0()) && $0().contains(point) {
                    blueColorPathsArray.append($0())
                }
            })
        case .red:
            greenBrownBlueRedPaths.redColorPaths.forEach({
                if !redColorPathsArray.contains($0()) && $0().contains(point) {
                    redColorPathsArray.append($0())
                }
            })
        }
    }
}
