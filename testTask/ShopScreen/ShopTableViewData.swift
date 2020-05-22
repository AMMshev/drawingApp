//
//  TableViewData.swift
//  testTask
//
//  Created by Artem Manyshev on 22.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import Foundation

struct ShopData {
    let cellDataArray = [
        ShopCellModel(colorCount: 20, price: nil, freeTask: "watch free video", bonus: nil, bonusTaskName: " Watch",
                      stickerName: nil),
        ShopCellModel(colorCount: 7000, price: nil, freeTask: "+ exclusive images", bonus: nil,
                      bonusTaskName: " Join", stickerName: "unlock gift"),
        ShopCellModel(colorCount: 1000, price: "$1.19", freeTask: nil, bonus: nil, bonusTaskName: nil,
                      stickerName: nil),
        ShopCellModel(colorCount: 5000, price: "$3.49", freeTask: nil, bonus: "+ 2000 free bonus",
                      bonusTaskName: nil, stickerName: "most popular"),
        ShopCellModel(colorCount: 10000, price: "$5.99", freeTask: nil, bonus: "+ 5000 free bonus",
                      bonusTaskName: nil, stickerName: nil),
        ShopCellModel(colorCount: 50000, price: "$23.99", freeTask: nil, bonus: "+ 5000 free bonus",
                      bonusTaskName: nil, stickerName: nil),
        ShopCellModel(colorCount: 150000, price: "$49.99", freeTask: nil, bonus: "+ 100 000 free bonus",
                      bonusTaskName: nil, stickerName: "best value")
    ]
}
