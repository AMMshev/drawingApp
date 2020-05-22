//
//  DataStructureForIntroduction.swift
//  testTask
//
//  Created by Artem Manyshev on 20.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import Foundation

struct IntroductionPageModel {
    let pageImageName: String
    let pageTitle: String
    let pageDescription: String
    let priceImageName: String?
}

struct DataForIntroduction {
    let pagesArray = [
        IntroductionPageModel(pageImageName: "stick",
                              pageTitle: "Magic Wand Tool",
                              pageDescription: "Color any shape in your field of view", priceImageName: "fill1"),
        IntroductionPageModel(pageImageName: "search",
                              pageTitle: "Magic Search Tool",
                              pageDescription: "Find lost shapes for choosen color",
                              priceImageName: "fill20"),
        IntroductionPageModel(pageImageName: "zoom",
                              pageTitle: "Zoom Tool",
                              pageDescription: "Discover more details with smart zoom",
                              priceImageName: nil)
    ]
}
