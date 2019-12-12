//
//  MSMineItemViewModel.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/9.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

enum MSMineItemType: Int {
    case Mine = 0
    case Number = 1
    case Blank = 2
}

class MSMineItemViewModel: NSObject {
    
    /// item是否已经被点开
    var itemRevealed: Bool
    
    /// item类型，雷还是数字还是已经被点开。
    var itemType: MSMineItemType
    
    /// 四周地雷的数量
    var minesNumber: Int
        
    override init() {
        itemRevealed = false
        itemType = .Blank
        minesNumber = 0
        super.init()
    }
}
