//
//  DataStructureFor.swift
//  testTask
//
//  Created by Artem Manyshev on 19.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import Foundation

struct SectionModel {
    let sectionName: String
    let imageName: String
    let cellsPictures: [String]
}
//  MARK: - model of table view cells at main screen
struct Sections {
    let sectionsArray = [
        SectionModel(sectionName: "Animals",
                     imageName: "animals",
                     cellsPictures: ["elephant", "rabbit", "wolf"]),
        SectionModel(sectionName: "Flowers",
                     imageName: "flowers",
                     cellsPictures: ["firstFlower", "secondFlower", "thirdFlower"]),
        SectionModel(sectionName: "Birds",
                     imageName: "birds",
                     cellsPictures: ["firstBird", "secondBird", "thirdBird"])
    ]
}
