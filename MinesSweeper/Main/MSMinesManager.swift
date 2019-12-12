//
//  MSMinesManager.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/11.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

enum MSMineBoardType: Int {
    case Small = 0
    case Middle = 1
    case Large = 2
}

class MSMineBoardConfig {
    
    var boardRow: Int
    var boardCol: Int
    var minesNumber: Int
    
    init(type: MSMineBoardType) {
//        switch type {
//        default:
//        case .Small:
            boardRow = 10
            boardCol = 10
            minesNumber = 10
//        case .Middle: break
            
//        case .Large: break
            
//        }
    }
}

class MSMinesManager: NSObject {

    class func configModels(config: MSMineBoardConfig) -> Array<Array<MSMineItemViewModel>> {
        //这里
        var numberSet: Set<Int> = Set()
        while numberSet.count !=  config.minesNumber{
            numberSet.insert(Int.random(in: 0 ..< config.boardRow * config.boardCol))
        }
        let numberArray = Array(numberSet).sorted { (a, b) -> Bool in
            a < b
        }
        print(numberArray)
        var index = 0
        var result: Array<Array<MSMineItemViewModel>> = Array()
        for i in 0 ..< config.boardRow {
            var rowArray: Array<MSMineItemViewModel> = Array<MSMineItemViewModel>()
            for j in 0 ..< config.boardCol {
                let model: MSMineItemViewModel = MSMineItemViewModel()
                if index < numberArray.count && (i * 10 + j) == numberArray[index] {
                    model.itemType = .Mine
                    index += 1
                } else {
                    model.itemType = .Blank
                }
                rowArray.append(model)
            }
            result.append(rowArray)
        }
        
        return result
    }
}
