
//
//  MSFlippedView.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/18.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

class MSFlippedView: NSView {

    var userInteractionEnabled: Bool
    
    override init(frame frameRect: NSRect) {
        userInteractionEnabled = true
        super.init(frame: frameRect)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isFlipped: Bool {
        return true;
    }
    
    override func hitTest(_ point: NSPoint) -> NSView? {
        if !userInteractionEnabled {
            return nil
        } else {
            return super.hitTest(point)
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
