//
//  MSMineTopBar.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/19.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

typealias ButtonAction = () -> ()

class MSMineTopBar: MSFlippedView {
    var buttonAction: ButtonAction?
    private var middleButton: NSButton!
    
    override init(frame frameRect: NSRect) {
        middleButton = NSButton(frame: NSRect(origin: CGPoint.zero, size: CGSize(width: MSMacro.mineItemWidth, height: MSMacro.mineItemWidth)))
        boardStatus = .Default
        super.init(frame: frameRect)
        
        self.addSubview(middleButton)
        middleButton.wantsLayer = true
        middleButton.title = ""
        middleButton.target = self
        middleButton.action = #selector(middleButtonAction(_:))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        middleButton.frame.origin = CGPoint(x: (self.frame.width - middleButton.frame.width) / 2, y: (self.frame.height - middleButton.frame.height) / 2.0)
    }
    
    //MARK: action
    
    @objc func middleButtonAction(_ sender: NSButton) -> Void {
        if (buttonAction != nil) {
            buttonAction!()
        }
    }
    
    //MARK: set status
    var boardStatus: MSBoardStatus {
        didSet {
            switch self.boardStatus {
            case .Default:
                middleButton.layer?.backgroundColor = NSColor.lightGray.withAlphaComponent(0.5).cgColor
            case .Fail:
                middleButton.layer?.backgroundColor = NSColor.red.withAlphaComponent(0.5).cgColor
            case .Succeed:
                middleButton.layer?.backgroundColor = NSColor.green.withAlphaComponent(0.5).cgColor
            }
        }
    }
}
