//
//  MSMineItemView.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/9.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

class MSMineItemView: NSView {
    var viewModel: MSMineItemViewModel!
    var unravealView: NSView!
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        wantsLayer = true
        layer?.backgroundColor = MSColor.itemSelectedColor.cgColor
        layer?.borderWidth = 1;
        layer?.borderColor = NSColor.textColor.cgColor;
        
        viewModel = MSMineItemViewModel()
        unravealView = NSView(frame: NSRect(origin: .zero, size: frame.size))
        unravealView.wantsLayer = true
        unravealView.layer?.backgroundColor = MSColor.itemNormalColor.cgColor
        self.addSubview(unravealView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    //MARK: tap event
    
    override func mouseUp(with event: NSEvent) {
        if unravealView.superview != nil {
            unravealView.removeFromSuperview()
        }
    }
    
    //MARK: child need implementation
    
     func setNumber(_ number: Int) -> Void {
           //do nothing
       }
    
}
