//
//  BoosterButton.swift
//  testTask
//
//  Created by Artem Manyshev on 24.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class BoosterButton: UIButton {
    
    let infoButton: UIButton = {
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
    let boosterCostlabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 6.0)
        label.textColor = UIColor(named: "colorCount")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let boosterCostView: UIView = {
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
        widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        backgroundColor = .white
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.shadowRadius = 25.0
        layer.cornerRadius = 25.0
        layer.shadowOpacity = 0.2
        addSubview(infoButton)
        addSubview(boosterCostView)
        boosterCostView.addSubview(boosterCostlabel)
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: topAnchor),
            infoButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            boosterCostView.bottomAnchor.constraint(equalTo: bottomAnchor),
            boosterCostView.trailingAnchor.constraint(equalTo: trailingAnchor),
            boosterCostlabel.centerXAnchor.constraint(equalTo: boosterCostView.centerXAnchor),
            boosterCostlabel.centerYAnchor.constraint(equalTo: boosterCostView.centerYAnchor)
        ])
        
    }
    func chooseBooster(type: Constants.ImageNames.DrowingScreen.Boosters) {
        setImage(UIImage(named: type.rawValue), for: .normal)
        switch type {
        case .ananas:
            infoButton.setTitle("x16", for: .normal)
            let title = NSAttributedString(string: "x16", attributes: [
                NSAttributedString.Key.font: UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 6.0) ?? UIFont.systemFont(ofSize: 6.0),
                NSAttributedString.Key.foregroundColor: UIColor(named: "colorCount") ?? UIColor.systemPink
            ])
            infoButton.setAttributedTitle(title, for: .normal)
            boosterCostView.isHidden = true
        case .wand:
            infoButton.backgroundColor = .purple
            let title = NSAttributedString(string: "i", attributes: [
                NSAttributedString.Key.font: UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 10.0) ?? UIFont.systemFont(ofSize: 6.0),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ])
            infoButton.setAttributedTitle(title, for: .normal)
            boosterCostlabel.text = "113"
        case .loupe:
            infoButton.isHidden = true
            boosterCostlabel.text = "32"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
