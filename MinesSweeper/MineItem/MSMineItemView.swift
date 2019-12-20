//
//  MSMineItemView.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/9.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

class MSMineItemView: MSFlippedView {
    var viewModel: MSMineItemViewModel!
    var unrevealView: MSFlippedView!
    var revealed: Bool!
    var buttonAction: ButtonAction?

    override init(frame: CGRect) {
        revealed = false
        super.init(frame : frame)
        wantsLayer = true
        layer?.backgroundColor = MSColor.itemNormalColor.cgColor
        layer?.borderWidth = 1;
        layer?.borderColor = NSColor.textColor.cgColor;
        
        viewModel = MSMineItemViewModel()
        unrevealView = MSFlippedView(frame: NSRect(origin: .zero, size: frame.size))
        unrevealView.wantsLayer = true
        unrevealView.layer?.backgroundColor = MSColor.itemMaskColor.cgColor
        self.addSubview(unrevealView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: public func
    
    public func revealItem() {
        if unrevealView.superview != nil {
            unrevealView.removeFromSuperview()
            revealed = true
        }
    }
    
    //MARK: tap event
    
    override func mouseUp(with event: NSEvent) {
        if buttonAction != nil {
            buttonAction!()
        }
    }
    
    //MARK: child need implementation
    
     func setNumber(_ number: Int) -> Void {
           //do nothing
       }
    
}
