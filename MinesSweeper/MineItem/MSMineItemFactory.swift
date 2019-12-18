//
//  MSMineItemFactory.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/11.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

class MSMineItemFactory: NSObject {
    class func createItemView(model: MSMineItemViewModel, frame: CGRect) -> MSMineItemView {
        var itemView: MSMineItemView;
        switch model.itemType {
        case .Mine:
            itemView = MSMineItemMineView(frame: frame)
        case .Number:
            itemView = MSMineItemNumberView(frame: frame)
            itemView.setNumber(model.minesNumber)
        }
        return itemView;
    }
}
