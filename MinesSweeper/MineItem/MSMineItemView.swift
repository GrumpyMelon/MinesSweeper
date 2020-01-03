//
//  MSMineItemView.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/9.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

enum MSMineItemMarkStatus: Int {
    case Correct = 0
    case Incorrect = 1
    case CancelCorrect = 2
    case CancelIncorrect = 3
    case Fail = 4
}

class MSMineItemView: MSFlippedView {
    var viewModel: MSMineItemViewModel!
    var unrevealView: MSFlippedView!
    var flagView: NSImageView?
    var revealed: Bool!
    var buttonAction: ButtonAction?
    var rightMouseUpAction: ButtonAction?

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
    
    public func revealItem() -> Bool {
        var revealResult = false
        if unrevealView.superview != nil {
            unrevealView.removeFromSuperview()
            revealed = true
            revealResult = true
        }
        if flagView != nil && flagView!.superview == self {
            flagView!.removeFromSuperview()
        }
        return revealResult
    }
    
    public func markItem() -> MSMineItemMarkStatus {
        if revealed {
            return .Fail;
        }
        var markResult: MSMineItemMarkStatus = .Fail
       
        if flagView == nil {
            flagView = NSImageView(image: NSImage(named: NSImage.Name("flag_icon"))!)
            flagView!.frame = self.bounds
        }
        if flagView!.superview == self {
            flagView!.removeFromSuperview()
            if self.viewModel.itemType == .Mine {
                markResult = .CancelCorrect
            } else {
                markResult = .CancelIncorrect
            }
        } else {
            self.addSubview(flagView!)
            if self.viewModel.itemType == .Mine {
                markResult = .Correct
            } else {
                markResult = .Incorrect
            }
        }
        return markResult;
    }
    
    //MARK: tap event
    
    override func mouseUp(with event: NSEvent) {
        if buttonAction != nil {
            buttonAction!()
        }
    }
    
    override func rightMouseUp(with event: NSEvent) {
        if rightMouseUpAction != nil {
            rightMouseUpAction!()
        }
    }
    
    //MARK: child need implementation
    
     func setNumber(_ number: Int) -> Void {
           //do nothing
       }
    
}
