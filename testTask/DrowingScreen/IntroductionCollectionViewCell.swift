//
//  IntroductionCollectionVIewCell.swift
//  testTask
//
//  Created by Artem Manyshev on 20.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class IntroductionCollectionViewCell: UICollectionViewCell {
    
    let pageImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let pageTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ArialRoundedMTBold", size: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ArialRoundedMTProCyr", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.widthAnchor.constraint(equalToConstant: 180).isActive = true
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let priceImageView: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let effect = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        effect.frame = bounds
        effect.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        effect.alpha = 0.97
        addSubview(effect)
        addSubview(pageImage)
        addSubview(pageTitle)
        addSubview(descriptionLabel)
        addSubview(priceImageView)
        NSLayoutConstraint.activate([
            effect.topAnchor.constraint(equalTo: topAnchor),
            effect.leadingAnchor.constraint(equalTo: leadingAnchor),
            effect.bottomAnchor.constraint(equalTo: bottomAnchor),
            effect.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            pageTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor,
                                                      constant: 60),
            priceImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15),
            priceImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setPageData(pageImageName: String, pageTitle: String, description: String, priceImageName: String?) {
        self.pageImage.image = UIImage(named: pageImageName)
        self.pageTitle.text = pageTitle
        self.descriptionLabel.text = description
        guard let priceImageName = priceImageName else { return }
        self.priceImageView.image = UIImage(named: priceImageName)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
