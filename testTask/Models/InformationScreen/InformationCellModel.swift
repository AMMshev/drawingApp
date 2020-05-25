//
//  DataStructureForInfo.swift
//  testTask
//
//  Created by Artem Manyshev on 21.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import Foundation
//  MARK: - model of collection view cells at information screen(button INFO)
struct InformationScreenCellModel {
    let imageName: String
    let labelText: String
}

struct InformationScreenData {
    let cellsDataArray: [InformationScreenCellModel] = [
        InformationScreenCellModel(imageName: "restore", labelText: "Restore\nPurchases"),
        InformationScreenCellModel(imageName: "tellafriend", labelText: "Tell\na friend"),
        InformationScreenCellModel(imageName: "ratereview", labelText: "Rate &\nReview"),
        InformationScreenCellModel(imageName: "padlock", labelText: "Privacy\nPolicy"),
        InformationScreenCellModel(imageName: "law", labelText: "Terms of\nUse"),
        InformationScreenCellModel(imageName: "support", labelText: "Support &\nFeedback")
    ]
}
