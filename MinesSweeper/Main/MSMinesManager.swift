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

    class func configViewModel(config: MSMineBoardConfig) -> MSMainViewModel {
        //这里
        var numberSet: Set<Int> = Set()
        while numberSet.count !=  config.minesNumber{
            numberSet.insert(Int.random(in: 0 ..< config.boardRow * config.boardCol))
        }
        let numberArray = Array(numberSet).sorted { (a, b) -> Bool in
            a < b
        }
        var index = 0
        
        let viewModel = MSMainViewModel(config: config)
        for i in 0 ..< config.boardRow {
            var rowArray: Array<MSMineItemViewModel> = Array<MSMineItemViewModel>()
            for j in 0 ..< config.boardCol {
                //创建所有的model
                let model: MSMineItemViewModel = MSMineItemViewModel()
                if index < numberArray.count && (i * 10 + j) == numberArray[index] {
                    model.itemType = .Mine
                    index += 1
                    viewModel.minesIndexArray.append((i, j))
                } else {
                    model.itemType = .Number
                }
                rowArray.append(model)
            }
            viewModel.itemsModelArray.append(rowArray)
        }
        
        for (i, j) in viewModel.minesIndexArray {
            print(i, j)
            //遍历所有的地雷，给四周的格子增加number
            let aroundItemIndex : Array<(Int, Int)> = [(i - 1, j - 1), (i, j - 1), (i + 1, j - 1),
                                                       (i - 1, j),                 (i + 1, j),
                                                       (i - 1, j + 1), (i, j + 1), (i + 1, j + 1)]
            for (iAround, jAround) in aroundItemIndex {
                let model : MSMineItemViewModel? = viewModel.itemsModelArray[safe: iAround]?[safe: jAround]
                if model != nil && model!.itemType == .Number {
                    model!.minesNumber += 1;
                }
            }
        }
        
        return viewModel
    }
}
