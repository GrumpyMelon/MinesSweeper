//
//  MSMainViewController.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/9.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

class MSMainViewController: NSViewController {

    var viewModel: MSMainViewModel?
    
    override func loadView() {
        view = MSFlippedView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.wantsLayer = true;
        view.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor;
        configModel()
        configMines()
    }
    
    func configModel() {
        let config = MSMineBoardConfig(type: .Small)
        self.viewModel = MSMinesManager.configViewModel(config: config)

        // todo: 设置window大小的问题。
        let windowSize = CGSize(width: MSMacro.mineItemWidth * config.boardRow, height: MSMacro.mineItemWidth * config.boardCol);
        MSMacro.appDelegate.window.setContentSize(windowSize)
    }
    
    func configMines() {
        let viewModel: MSMainViewModel! = self.viewModel;
        for i in 0 ..< viewModel.boardConfig.boardRow {
            for j in 0 ..< viewModel.boardConfig.boardCol {
                let origin = CGPoint(x:j * MSMacro.mineItemWidth, y:i * MSMacro.mineItemWidth)
                let size = CGSize(width: MSMacro.mineItemWidth, height: MSMacro.mineItemWidth)
                let frame = NSRect(origin: origin, size: size)
                
                let item: MSMineItemView = MSMineItemFactory.createItemView(model: viewModel.itemsModelArray[i][j], frame: frame)
                view.addSubview(item)
            }
        }
        
    }
}
