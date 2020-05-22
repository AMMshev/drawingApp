//
//  DrawingViewController.swift
//  testTask
//
//  Created by Artem Manyshev on 19.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController {
    
    let sections = Sections().sectionsArray
    var sectionIndex: Int
    var pictureIndex: Int
    var settingsMenuIsHidden = true
    
    let backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.shadowRadius = 25.0
        button.layer.shadowOpacity = 0.1
        button.layer.cornerRadius = 25.0
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 1.0, height: 1.5)
        button.setImage(UIImage(named: "back"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    let settingsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let settingsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25.0
        view.layer.shadowRadius = 25.0
        view.layer.shadowOpacity = 0.2
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        view.widthAnchor.constraint(equalToConstant: 50).isActive = true
        view.backgroundColor = .white
        return view
    }()
    var settingsViewHeight = NSLayoutConstraint()
    var settingsGeneralButton = UIButton()
    var settingsVibrantButton = UIButton()
    var settingsAudioButton = UIButton()
    let drowingImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let colorCountView: ColorCountView = {
        let view = ColorCountView()
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        view.layer.shadowRadius = 25.0
        view.layer.cornerRadius = 25.0
        view.layer.shadowOpacity = 0.2
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    let addColorCountButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addColorCount"), for: .normal)
        button.addTarget(self, action: #selector(addColorButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var introductionVC = IntroductionViewController()
    
    init(sectionIndex: Int, pictureIndex: Int, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.sectionIndex = sectionIndex
        self.pictureIndex = pictureIndex
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = .white
        setupChildVC()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubiews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navigationController = UIApplication.shared.windows[0].rootViewController as? NavigationController
        navigationController?.menuBarView.isHidden = true
    }
    fileprivate func setupChildVC() {
        introductionVC.delegate = self
        addChild(introductionVC)
        view.addSubview(introductionVC.view)
        introductionVC.willMove(toParent: self)
    }
    fileprivate func setupSubiews() {
        view.addSubview(drowingImage)
        view.addSubview(backButton)
        view.addSubview(settingsView)
        view.addSubview(colorCountView)
        settingsView.addSubview(settingsStackView)
        colorCountView.stackView.addArrangedSubview(addColorCountButton)
        settingsVibrantButton = setButton(imageName: "vibra", action: nil)
        settingsAudioButton = setButton(imageName: "audioon", action: nil)
        settingsGeneralButton = setButton(imageName: "settingsInactive",
                                          action: #selector(settingsButtonTapped))
        settingsAudioButton.isHidden = true
        settingsVibrantButton.isHidden = true
        settingsStackView.addArrangedSubview(settingsGeneralButton)
        settingsStackView.addArrangedSubview(settingsVibrantButton)
        settingsStackView.addArrangedSubview(settingsAudioButton)
        settingsViewHeight = settingsView.heightAnchor.constraint(equalToConstant: 50)
        NSLayoutConstraint.activate([
            settingsViewHeight,
            drowingImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            drowingImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            drowingImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            drowingImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            settingsStackView.topAnchor.constraint(equalTo: settingsView.topAnchor),
            settingsStackView.leadingAnchor.constraint(equalTo: settingsView.leadingAnchor),
            settingsStackView.bottomAnchor.constraint(equalTo: settingsView.bottomAnchor),
            settingsStackView.trailingAnchor.constraint(equalTo: settingsView.trailingAnchor),
            settingsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            settingsView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                   constant: -15),
            colorCountView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorCountView.centerYAnchor.constraint(equalTo: backButton.centerYAnchor)
        ])
        drowingImage.image = UIImage(named: sections[sectionIndex].cellsPictures[pictureIndex])
    }
    
    func setButton(imageName: String, action: Selector?) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: .normal)
        if let action = action {
            button.addTarget(self, action: action, for: .touchUpInside)
        }
        return button
    }
    @objc func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    @objc func settingsButtonTapped() {
        if settingsMenuIsHidden {
            settingsViewHeight.constant = 150
            settingsGeneralButton.setImage(UIImage(named: "settingsActive"), for: .normal)
            self.settingsAudioButton.isHidden = false
            self.settingsVibrantButton.isHidden = false
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        } else {
            settingsViewHeight.constant = 50
            settingsGeneralButton.setImage(UIImage(named: "settingsInactive"), for: .normal)
            self.settingsAudioButton.isHidden = true
            self.settingsVibrantButton.isHidden = true
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        settingsMenuIsHidden = !settingsMenuIsHidden
    }
    
    @objc func addColorButtonTapped() {
        let shopVC = ShopViewController(nibName: nil, bundle: nil)
        present(shopVC, animated: true, completion: nil)
    }
}

extension DrawingViewController: IntroductionViewCellDelegate {
    
    func hideIntroduction(onLeftSide: Bool) {
        var xTranslation = UIScreen.main.bounds.width
        if onLeftSide == false {
            xTranslation *= -1
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.introductionVC.view.transform = CGAffineTransform(translationX: xTranslation, y: 0)
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.introductionVC.willMove(toParent: nil)
                self.introductionVC.view.removeFromSuperview()
                self.introductionVC.removeFromParent()
            }
        }
    }
}
