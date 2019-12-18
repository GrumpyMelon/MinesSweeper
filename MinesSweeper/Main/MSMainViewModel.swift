//
//  MSMainViewModel.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/12.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

class MSMainViewModel: NSObject {
    var boardConfig: MSMineBoardConfig
    var itemsModelArray: Array<Array<MSMineItemViewModel>>
    var minesIndexArray: Array<(Int, Int)>
    
    init(config : MSMineBoardConfig) {
        boardConfig =  config
        itemsModelArray = Array()
        minesIndexArray = Array()
        super.init()
    }
}
