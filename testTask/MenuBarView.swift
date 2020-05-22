//
//  MenuBar.swift
//  testTask
//
//  Created by Artem Manyshev on 20.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class MenuBarView: UIView {
    
    private let shelfView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        view.layer.shadowRadius = 30.0
        view.layer.cornerRadius = 30.0
        view.layer.shadowOpacity = 0.1
        return view
    }()
    private var mainMenuButton = UIButton()
    private var easelButton = UIButton()
    private var giftButton = UIButton()
    private var infoButton = UIButton()
    private var isInfoVCpresented = false
    private let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(shelfView)
        shelfView.addSubview(buttonsStackView)
        NSLayoutConstraint.activate([
            shelfView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            shelfView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            shelfView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            shelfView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            buttonsStackView.topAnchor.constraint(equalTo: shelfView.topAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: shelfView.leadingAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: shelfView.bottomAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: shelfView.trailingAnchor)
        ])
        mainMenuButton = setButton(imageName: Constants.ImageNames.MenuBar.birdActive.rawValue,
                                   action: #selector(menuButtonTapped(sender:)))
        easelButton = setButton(imageName: Constants.ImageNames.MenuBar.gift.rawValue,
                                action: #selector(menuButtonTapped(sender:)))
        giftButton = setButton(imageName: Constants.ImageNames.MenuBar.paint.rawValue,
                               action: #selector(menuButtonTapped(sender:)))
        infoButton = setButton(imageName: Constants.ImageNames.MenuBar.info.rawValue,
                               action: #selector(menuButtonTapped(sender:)))
        buttonsStackView.addArrangedSubview(mainMenuButton)
        buttonsStackView.addArrangedSubview(easelButton)
        buttonsStackView.addArrangedSubview(giftButton)
        buttonsStackView.addArrangedSubview(infoButton)
    }
    
    private func setButtonsInactiveImages() {
        mainMenuButton.setImage(UIImage(named: Constants.ImageNames.MenuBar.bird.rawValue),
                                for: .normal)
        easelButton.setImage(UIImage(named: Constants.ImageNames.MenuBar.gift.rawValue),
                             for: .normal)
        giftButton.setImage(UIImage(named: Constants.ImageNames.MenuBar.paint.rawValue),
                            for: .normal)
        infoButton.setImage(UIImage(named: Constants.ImageNames.MenuBar.info.rawValue),
                            for: .normal)
    }
    
    private func setButton(imageName: String, action: Selector?) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: .normal)
        if let action = action {
            button.addTarget(self, action: action, for: .touchUpInside)
        }
        return button
    }
    @objc private func menuButtonTapped(sender: UIButton) {
        let navigationController = UIApplication.shared.windows[0].rootViewController as? NavigationController
        if sender == mainMenuButton {
            navigationController?.popToRootViewController(animated: false)
            setButtonsInactiveImages()
            mainMenuButton.setImage(UIImage(named: Constants.ImageNames.MenuBar.birdActive.rawValue), for: .normal)
            isInfoVCpresented = false
        }
        if sender == infoButton && isInfoVCpresented == false {
            isInfoVCpresented = true
            let infoVC = InformationScreenViewController(nibName: nil, bundle: nil)
            setButtonsInactiveImages()
            infoButton.setImage(UIImage(named: Constants.ImageNames.MenuBar.infoActive.rawValue), for: .normal)
            navigationController?.pushViewController(infoVC, animated: false)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
