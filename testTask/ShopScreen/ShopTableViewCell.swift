//
//  ShopTableViewCell.swift
//  testTask
//
//  Created by Artem Manyshev on 21.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class ShopTableViewCell: UITableViewCell {
    
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
        let imageView = UIImageView(image: UIImage(named: "fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var countAndBonusStackView = UIStackView()
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
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(mainView)
        mainView.addSubview(paintImageView)
        mainView.addSubview(countAndBonusStackView)
        addSubview(stickerView)
        mainView.addSubview(priceButton)
        selectionStyle = .none
        NSLayoutConstraint.activate([
            mainView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            paintImageView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            paintImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            countAndBonusStackView.leadingAnchor.constraint(equalTo: paintImageView.trailingAnchor, constant: 15),
            countAndBonusStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            priceButton.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            priceButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,
                                                  constant: -15),
            stickerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stickerView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        priceButton.addTarget(self, action: #selector(priceButtonTapped), for: .touchUpInside)
    }
    
    func setColorCountAndBonusStack(colorCount: Int, freeTask: String?,
                                    bonus: String?) {
        countAndBonusStackView.translatesAutoresizingMaskIntoConstraints = false
        let colorCountLabel = UILabel()
        colorCountLabel.text = String(colorCount)
        colorCountLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 24)
        colorCountLabel.textColor = UIColor(named: "colorCount")
        countAndBonusStackView.addArrangedSubview(colorCountLabel)
        if let bonus = bonus {
            let bonusLabel = UILabel()
            bonusLabel.text = bonus
            bonusLabel.textColor = #colorLiteral(red: 0.4392156863, green: 0.1411764706, blue: 0.831372549, alpha: 1)
            bonusLabel.font = UIFont(name: "ArialRoundedMTProCyr", size: 10)
            countAndBonusStackView.addArrangedSubview(bonusLabel)
        }
        if let freeTask = freeTask {
            let taskLabel = UILabel()
            taskLabel.text = freeTask
            taskLabel.font = UIFont(name: "ArialRoundedMTProCyr", size: 10)
            countAndBonusStackView.addArrangedSubview(taskLabel)
        }
        countAndBonusStackView.axis = .vertical
        countAndBonusStackView.alignment = .fill
        countAndBonusStackView.distribution = .fill
    }
    
    func setPriceAndSticker(price: String?, bonusTaskName: String?,
                            stickerName: String?) {
        if let price = price {
            let buttonsTitle = NSAttributedString(string: price, attributes: [NSAttributedString.Key.font:
                UIFont(name: "ArialRoundedMTProCyr", size: 12) ??
                    UIFont.systemFont(ofSize: 12)])
            priceButton.setAttributedTitle(buttonsTitle, for: .normal)
            priceButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
            priceButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
            priceButton.layer.shadowColor = UIColor.gray.cgColor
            priceButton.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            priceButton.layer.shadowRadius = 15.0
            priceButton.layer.cornerRadius = 15.0
            priceButton.layer.shadowOpacity = 0.1
        }
        if let bonusTaskImageName = bonusTaskName {
            priceButton.setImage(UIImage(named: bonusTaskImageName), for: .normal)
        }
        if let stickerName = stickerName {
            let stickerTitle = UILabel()
            stickerTitle.translatesAutoresizingMaskIntoConstraints = false
            stickerView.addSubview(stickerTitle)
            stickerTitle.centerYAnchor.constraint(equalTo: stickerView.centerYAnchor).isActive = true
            stickerTitle.centerXAnchor.constraint(equalTo: stickerView.centerXAnchor).isActive = true
            stickerTitle.textColor = .white
            let title = NSAttributedString(string: stickerName,
                                           attributes: [NSAttributedString.Key.font:
                                            UIFont(name: "ArialRoundedMTProCyr", size: 6) ?? UIFont.systemFont(ofSize: 6)])
            switch stickerName {
            case "unlock gift":
                stickerTitle.attributedText = title
                stickerView.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.1411764706, blue: 0.831372549, alpha: 1)
            case "most popular":
                stickerTitle.attributedText = title
                stickerView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.8549019608, blue: 0.3607843137, alpha: 1)
            case "best value":
                stickerTitle.attributedText = title
                stickerView.backgroundColor = #colorLiteral(red: 1, green: 0.4, blue: 0.4, alpha: 1)
            default:
                stickerTitle.text = stickerName
            }
        }
        if let bonusTaskName = bonusTaskName {
            priceButton.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.1411764706, blue: 0.831372549, alpha: 1)
            let buttonsTitle = NSAttributedString(string: bonusTaskName, attributes: [NSAttributedString.Key.font:
                UIFont(name: "ArialRoundedMTProCyr", size: 12) ?? UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.white])
            priceButton.setAttributedTitle(buttonsTitle, for: .normal)
            switch bonusTaskName {
            case " Watch":
                priceButton.setImage(UIImage(named: "watch"), for: .normal)
                priceButton.setTitle(bonusTaskName, for: .normal)
            case " Join":
                priceButton.setImage(UIImage(named: "join"), for: .normal)
                priceButton.setTitle(bonusTaskName, for: .normal)
            default:
                priceButton.setTitle(bonusTaskName, for: .normal)
            }
        }
    }
    
    @objc func priceButtonTapped() {
        print("button tapped")
    }
}
