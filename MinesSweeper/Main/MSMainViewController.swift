//
//  MSMainViewController.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/9.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

class MSMainViewController: NSViewController {

    override func loadView() {
        view = NSView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.wantsLayer = true;
        view.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor;
        
        configMines()
    }
    
    func configMines() {
        let config = MSMineBoardConfig(type: .Small)
        let models = MSMinesManager.configModels(config: config)
        
        let windowSize = CGSize(width: MSMacro.mineItemWidth * config.boardRow, height: MSMacro.mineItemWidth * config.boardCol);
        MSMacro.appDelegate.window.setContentSize(windowSize)

        for i in 0 ..< config.boardRow {
            for j in 0 ..< config.boardCol {
                let origin = CGPoint(x:j * MSMacro.mineItemWidth, y:i * MSMacro.mineItemWidth)
                let size = CGSize(width: MSMacro.mineItemWidth, height: MSMacro.mineItemWidth)
                let frame = NSRect(origin: origin, size: size)
                
                let item: MSMineItemView = MSMineItemFactory.createItemView(model: models[i][j], frame: frame)
                view.addSubview(item)
            }
        }
    }
}
