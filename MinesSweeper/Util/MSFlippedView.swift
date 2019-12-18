
//
//  MSFlippedView.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/18.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

class MSFlippedView: NSView {

    override var isFlipped: Bool {
        return true;
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
