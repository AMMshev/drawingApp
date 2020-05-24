//
//  ShopCellModel.swift
//  testTask
//
//  Created by Artem Manyshev on 22.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import Foundation

struct ShopCellModel{
    let colorCount: Double
    let price: String?
    let freeTask: String?
    let bonus: String?
    let bonusTaskName: Constants.BonusTasksNames?
    let stickerName: Constants.StickersNames?
}

struct ShopData {
    let cellDataArray = [
        ShopCellModel(colorCount: 20.0, price: nil, freeTask: "watch free video", bonus: nil,
                      bonusTaskName: .watch, stickerName: nil),
        ShopCellModel(colorCount: 7000.0, price: nil, freeTask: "+ exclusive images", bonus: nil,
                      bonusTaskName: .join, stickerName: .unlockGift),
        ShopCellModel(colorCount: 1000.0, price: "$1.19", freeTask: nil, bonus: nil,
                      bonusTaskName: nil, stickerName: nil),
        ShopCellModel(colorCount: 5000.0, price: "$3.49", freeTask: nil,
                      bonus: "+ 2000 free bonus", bonusTaskName: nil,
                      stickerName: .mostPopular),
        ShopCellModel(colorCount: 10000.0, price: "$5.99", freeTask: nil,
                      bonus: "+ 5000 free bonus", bonusTaskName: nil, stickerName: nil),
        ShopCellModel(colorCount: 50000.0, price: "$23.99", freeTask: nil, bonus: "+ 5000 free bonus", bonusTaskName: nil, stickerName: nil),
        ShopCellModel(colorCount: 150000.0, price: "$49.99", freeTask: nil, bonus: "+ 100 000 free bonus", bonusTaskName: nil, stickerName: .bestValue)
    ]
}
