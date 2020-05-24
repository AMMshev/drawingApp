//
//  TrainingCollectionViewCell.swift
//  testTask
//
//  Created by Artem Manyshev on 20.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class TrainingCollectionViewCell: UICollectionViewCell {
    
    fileprivate let pageImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    fileprivate let pageTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    fileprivate let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.arialRoundedMTProCyr.rawValue, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.widthAnchor.constraint(equalToConstant: 180).isActive = true
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    fileprivate let priceImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    fileprivate let blurEffect = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        blurEffect.frame = bounds
        blurEffect.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffect.alpha = 0.97
        addSubview(blurEffect)
        addSubview(pageImage)
        addSubview(pageTitle)
        addSubview(descriptionLabel)
        addSubview(priceImageView)
        NSLayoutConstraint.activate([
            blurEffect.topAnchor.constraint(equalTo: topAnchor),
            blurEffect.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurEffect.bottomAnchor.constraint(equalTo: bottomAnchor),
            blurEffect.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -60),
            pageTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageTitle.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: pageTitle.bottomAnchor,
                                                  constant: 30),
            priceImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,
                                                constant: 15),
            priceImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    func addToPage(image: String, title: String, description: String, priceImage: String?) {
        self.pageImage.image = UIImage(named: image)
        self.pageTitle.text = title
        self.descriptionLabel.text = description
        guard let priceImageName = priceImage else { return }
        self.priceImageView.image = UIImage(named: priceImageName)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
