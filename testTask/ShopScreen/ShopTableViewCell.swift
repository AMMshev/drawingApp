//
//  ShopTableViewCell.swift
//  testTask
//
//  Created by Artem Manyshev on 21.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

protocol ShopTableViewCellDelegate: class {
    func buyColor(boughtColorCount: Double) -> Void
}

protocol shopActionDelegate: class {
    func balanceCountChanged() -> Void
}
class ShopTableViewCell: UITableViewCell {
    
    weak open var delegate: ShopTableViewCellDelegate?
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 70).isActive = true
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        view.layer.shadowRadius = 7.5
        view.layer.cornerRadius = 7.5
        view.layer.shadowOpacity = 0.1
        return view
    }()
    private let paintImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Constants.ImageNames.fill.rawValue))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var countAndBonusStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    private var colorCountLabel = UILabel()
    private var bonusLabel = UILabel()
    private var taskLabel = UILabel()
    
    private var priceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        button.layer.cornerRadius = 15.0
        button.backgroundColor = .white
        return button
    }()
    private var stickerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 17.0).isActive = true
        view.widthAnchor.constraint(equalToConstant: 73.0).isActive = true
        view.layer.cornerRadius = 8.5
        return view
    }()
    var colorCount: Double = 0

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.addSubview(mainView)
        mainView.addSubview(paintImageView)
        mainView.addSubview(countAndBonusStackView)
        contentView.addSubview(stickerView)
        mainView.addSubview(priceButton)
        selectionStyle = .none
        NSLayoutConstraint.activate([
            mainView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            paintImageView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            paintImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            countAndBonusStackView.leadingAnchor.constraint(equalTo: paintImageView.trailingAnchor, constant: 15),
            countAndBonusStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            priceButton.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            priceButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,
                                                  constant: -15),
            stickerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stickerView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        priceButton.addTarget(self, action: #selector(priceButtonTapped), for: .touchUpInside)
        countAndBonusStackView.addArrangedSubview(colorCountLabel)
        countAndBonusStackView.addArrangedSubview(bonusLabel)
        countAndBonusStackView.addArrangedSubview(taskLabel)
    }
    
    func setColorCountAndBonusStack(freeTask: String?, bonus: String?) {
        
        colorCountLabel.text = String(colorCount.stringWithoutZeroFraction)
        colorCountLabel.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue,
                                      size: 24)
        colorCountLabel.textColor = UIColor(named: Constants.ImageNames.colorCount.rawValue)
        if let bonus = bonus {
            bonusLabel.text = bonus
            bonusLabel.textColor = #colorLiteral(red: 0.4392156863, green: 0.1411764706, blue: 0.831372549, alpha: 1)
            bonusLabel.font = UIFont(name: Constants.Fonts.arialRoundedMTProCyr.rawValue,
                                     size: 10)
        }
        if let freeTask = freeTask {
            taskLabel.text = freeTask
            taskLabel.font = UIFont(name: Constants.Fonts.arialRoundedMTProCyr.rawValue,
                                    size: 10)
        }
    }
    
    func setPriceAndSticker(price: String?, bonusTaskName: Constants.BonusTasksNames?,
                            stickerName: Constants.StickersNames?) {
        if let price = price {
            let buttonsTitle = NSAttributedString(string: price, attributes: [NSAttributedString.Key.font:
                UIFont(name: Constants.Fonts.arialRoundedMTProCyr.rawValue, size: 12)
                    ?? UIFont.systemFont(ofSize: 12)])
            priceButton.setAttributedTitle(buttonsTitle, for: .normal)
            priceButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
            priceButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
            priceButton.layer.shadowColor = UIColor.gray.cgColor
            priceButton.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            priceButton.layer.shadowRadius = 15.0
            priceButton.layer.cornerRadius = 15.0
            priceButton.layer.shadowOpacity = 0.1
        }
        if let stickerName = stickerName {
            let stickerTitle = UILabel()
            stickerTitle.translatesAutoresizingMaskIntoConstraints = false
            stickerView.addSubview(stickerTitle)
            stickerTitle.centerYAnchor.constraint(equalTo: stickerView.centerYAnchor).isActive = true
            stickerTitle.centerXAnchor.constraint(equalTo: stickerView.centerXAnchor).isActive = true
            stickerTitle.textColor = .white
            let title = NSAttributedString(string: stickerName.rawValue,
                                           attributes: [NSAttributedString.Key.font:UIFont(name: Constants.Fonts.arialRoundedMTProCyr.rawValue, size: 6) ?? UIFont.systemFont(ofSize: 6)])
            stickerTitle.attributedText = title
            switch stickerName {
            case .unlockGift:
                stickerView.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.1411764706, blue: 0.831372549, alpha: 1)
            case .mostPopular:
                stickerView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.8549019608, blue: 0.3607843137, alpha: 1)
            case .bestValue:
                stickerView.backgroundColor = #colorLiteral(red: 1, green: 0.4, blue: 0.4, alpha: 1)
            }
        }
        if let bonusTaskName = bonusTaskName {
            priceButton.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.1411764706, blue: 0.831372549, alpha: 1)
            let buttonsTitle = NSAttributedString(string: bonusTaskName.rawValue, attributes: [NSAttributedString.Key.font:
                UIFont(name: Constants.Fonts.arialRoundedMTProCyr.rawValue, size: 12) ?? UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.white])
            priceButton.setAttributedTitle(buttonsTitle, for: .normal)
            priceButton.setTitle(bonusTaskName.rawValue, for: .normal)
            switch bonusTaskName {
            case .watch:
                priceButton.setImage(UIImage(named: Constants.ImageNames.watch.rawValue),
                                     for: .normal)
            case .join:
                priceButton.setImage(UIImage(named: Constants.ImageNames.join.rawValue),
                                     for: .normal)
            }
        }
    }
    
    @objc func priceButtonTapped() {
        delegate?.buyColor(boughtColorCount: colorCount)
    }
}
