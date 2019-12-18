//
//  MSMineItemNumberView.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/10.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

class MSMineItemNumberView: MSMineItemView {

    var numberLabel: NSTextField!
    
    override init(frame: CGRect) {
        numberLabel = NSTextField()
        numberLabel.maximumNumberOfLines = 1;
        numberLabel.backgroundColor = .clear
        numberLabel.font = NSFont.boldSystemFont(ofSize: 20)
        numberLabel.textColor = MSColor.itemNumberColor
        numberLabel.alignment = .center
        numberLabel.isBezeled = false
        numberLabel.isEditable = false
        
        super.init(frame: frame)
        
        self.addSubview(numberLabel, positioned: .below, relativeTo: self.unravealView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK:
    
    override func setNumber(_ number: Int) -> Void {
        if number == 0 {
            numberLabel.isHidden = true
        } else {
            numberLabel.isHidden = false
            numberLabel.integerValue = number
            numberLabel.sizeToFit()
            numberLabel.frame = NSRect(origin: CGPoint(x: (self.frame.width - numberLabel.frame.width) / 2.0, y: (self.frame.height - numberLabel.frame.height) / 2.0), size: numberLabel.frame.size)
        }
    }
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
