//
//  SettingsView.swift
//  testTask
//
//  Created by Artem Manyshev on 23.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    var settingsGeneralButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.ImageNames.DrowingScreen.settingsInactive.rawValue), for: .normal)
        return button
    }()
    var settingsVibrantButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.ImageNames.DrowingScreen.vibra.rawValue), for: .normal)
        return button
    }()
    var settingsAudioButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.ImageNames.DrowingScreen.audioon.rawValue), for: .normal)
        return button
    }()
    fileprivate let settingsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 25.0
        layer.shadowRadius = 25.0
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        backgroundColor = .white
        addSubview(settingsStackView)
        NSLayoutConstraint.activate([
            settingsStackView.topAnchor.constraint(equalTo: topAnchor),
            settingsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            settingsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            settingsStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        settingsStackView.addArrangedSubview(settingsGeneralButton)
        settingsStackView.addArrangedSubview(settingsVibrantButton)
        settingsStackView.addArrangedSubview(settingsAudioButton)
        settingsVibrantButton.isHidden = true
        settingsAudioButton.isHidden = true
    }
    
    func hideButton() {
        settingsVibrantButton.isHidden = true
        settingsAudioButton.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
