//
//  Constants.swift
//  testTask
//
//  Created by Artem Manyshev on 22.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import Foundation

enum Constants {
    enum Fonts: String {
        case arialRoundedMTBold = "ArialRoundedMTBold"
        case arialRoundedMTProCyr = "ArialRoundedMTProCyr"
    }
    enum TableViewCellsID: String {
        case shopCell
        case sectionCell
    }
    enum CollectionViewCellsID: String {
        case informationCell
        case sectionCollectionCell
        case trainingCell
        case choisingColorCell
    }
    enum UserDafaultsKeys: String {
        case balance
    }
    enum ImageNames: String {
        case fill
        case colorCount
        case watch
        case join
        case witch
        case smile
        case cancel
        enum MenuBar: String {
            case birdActive
            case infoActive
            case gift
            case paint
            case info
            case bird
        }
        enum DrowingScreen: String {
            case back
            case addColorCount
            case vibra
            case audioon
            case settingsActive
            case settingsInactive
            enum Boosters: String {
                case ananas
                case wand
                case loupe
            }
        }
        enum MainScreen: String {
            case more
        }
    }
    enum StickersNames: String {
        case unlockGift = "unlock gift"
        case mostPopular = "most popular"
        case bestValue = "best value"
    }
    enum BonusTasksNames: String {
        case watch = " Watch"
        case join = " Join"
    }
    enum DrawingColorNames: String {
        case gray
        case lightBlue
        case green
        case brown
        case blue
        case red
    }
}
