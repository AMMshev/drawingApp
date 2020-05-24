//
//  BoosterButton.swift
//  testTask
//
//  Created by Artem Manyshev on 24.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class BoosterButton: UIButton {
    
    let rightTopButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 18.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 18.0).isActive = true
        button.backgroundColor = .white
        button.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        button.layer.cornerRadius = 9.0
        button.layer.shadowRadius = 9.0
        return button
    }()
    let rightBottomlabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 6.0)
        label.textColor = UIColor(named: "colorCount")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let rightBottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 18.0).isActive = true
        view.widthAnchor.constraint(equalToConstant: 18.0).isActive = true
        view.backgroundColor = .white
        view.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        view.layer.cornerRadius = 9.0
        view.layer.shadowRadius = 9.0
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 50).isActive = true
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        backgroundColor = .white
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.shadowRadius = 25.0
        layer.cornerRadius = 25.0
        layer.shadowOpacity = 0.2
        addSubview(rightTopButton)
        addSubview(rightBottomView)
        rightBottomView.addSubview(rightBottomlabel)
        NSLayoutConstraint.activate([
            rightTopButton.topAnchor.constraint(equalTo: topAnchor),
            rightTopButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightBottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            rightBottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightBottomlabel.centerXAnchor.constraint(equalTo: rightBottomView.centerXAnchor),
            rightBottomlabel.centerYAnchor.constraint(equalTo: rightBottomView.centerYAnchor)
        ])
        
    }
    func choseBooster(type: Constants.ImageNames.DrowingScreen.Boosters) {
        setImage(UIImage(named: type.rawValue), for: .normal)
        switch type {
        case .ananas:
            rightTopButton.setTitle("x16", for: .normal)
            let title = NSAttributedString(string: "x16", attributes: [
                NSAttributedString.Key.font: UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 6) ?? UIFont.systemFont(ofSize: 6),
                NSAttributedString.Key.foregroundColor: UIColor(named: "colorCount") ?? UIColor.systemPink
            ])
            rightTopButton.setAttributedTitle(title, for: .normal)
            rightBottomView.isHidden = true
        case .wand:
            rightTopButton.backgroundColor = .purple
            let title = NSAttributedString(string: "i", attributes: [
                NSAttributedString.Key.font: UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 6) ?? UIFont.systemFont(ofSize: 6),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ])
            rightTopButton.setAttributedTitle(title, for: .normal)
            rightBottomlabel.text = "113"
        case .loupe:
            rightTopButton.isHidden = true
            rightBottomlabel.text = "32"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
