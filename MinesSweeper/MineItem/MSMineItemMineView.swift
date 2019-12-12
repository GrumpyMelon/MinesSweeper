//
//  MSMineItemMineView.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/10.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

class MSMineItemMineView: MSMineItemView {

    var mineImageView: NSImageView!
    
    override init(frame: CGRect) {
        mineImageView = NSImageView(image: NSImage(named: NSImage.Name("mine_icon"))!)
        super.init(frame: frame)
        
        self.addSubview(mineImageView, positioned: .below, relativeTo: self.unravealView)
        mineImageView.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
