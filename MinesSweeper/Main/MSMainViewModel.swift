//
//  MSMainViewModel.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/12.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

enum MSBoardStatus: Int {
    case Default = 0
    case Fail = 1
    case Succeed = 2
}

class MSMainViewModel: NSObject {
    var boardConfig: MSMineBoardConfig
    var status: MSBoardStatus
    
    var revealedItemAmount: Int
    var correctedItemAmount: Int
    
    var itemsModelArray: Array<Array<MSMineItemViewModel>>
    var minesIndexArray: Array<(Int, Int)>
    
    init(config : MSMineBoardConfig) {
        boardConfig =  config
        itemsModelArray = Array()
        minesIndexArray = Array()
        status = .Default
        revealedItemAmount = 0
        correctedItemAmount = 0
        super.init()
    }
}
