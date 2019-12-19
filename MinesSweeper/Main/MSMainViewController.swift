//
//  MSMainViewController.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/9.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Cocoa

class MSMainViewController: NSViewController {

    var viewModel: MSMainViewModel!
    var topBarView: MSMineTopBar!
    var boardView: MSFlippedView!
    
    override func loadView() {
        view = MSFlippedView()
        topBarView = MSMineTopBar()
        topBarView.buttonAction = {() -> Void in
            self.barMiddleButtonAction()
        }
        boardView = MSFlippedView()
        view.addSubview(topBarView)
        view.addSubview(boardView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.wantsLayer = true;
        view.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor;
        self.setUpBoard()
    }
    
//MARK: - clean & set &reset
    
    func cleanBoard() {
        for subview in boardView.subviews {
            subview.removeFromSuperview()
        }
    }
    
    func setUpBoard() {
        configModel()
        configViewLayout()
        configMines()
    }
    
    func resetBoard() {
        cleanBoard()
        setUpBoard()
    }
    
    func configModel() {
        let config = MSMineBoardConfig(type: .Small)
        self.viewModel = MSMinesManager.configViewModel(config: config)
    }
    
    func configViewLayout() {
        let boardSize: NSSize = MSMacro.boardSize(row: self.viewModel.boardConfig.boardRow, col: self.viewModel.boardConfig.boardCol)
        topBarView.frame = NSRect(origin: NSPoint(x: 0, y: 0), size: NSSize(width: Double(boardSize.width), height: MSMacro.topBarHeight))
        boardView.frame = NSRect(origin: NSPoint(x: 0, y: topBarView.frame.height), size: boardSize)
        
        let windowSize = CGSize(width: boardSize.width, height: boardSize.height + topBarView.frame.height);
        let currentWindow: NSWindow! = MSMacro.appDelegate.window
        currentWindow.setContentSize(windowSize)
    }
    
    func configMines() {
        let viewModel: MSMainViewModel! = self.viewModel;
        for i in 0 ..< viewModel.boardConfig.boardRow {
            for j in 0 ..< viewModel.boardConfig.boardCol {
                let origin = CGPoint(x:Double(j) * MSMacro.mineItemWidth, y:Double(i) * MSMacro.mineItemWidth)
                let size = CGSize(width: MSMacro.mineItemWidth, height: MSMacro.mineItemWidth)
                let frame = NSRect(origin: origin, size: size)
                
                let item: MSMineItemView = MSMineItemFactory.createItemView(model: viewModel.itemsModelArray[i][j], frame: frame)
                boardView.addSubview(item)
            }
        }
    }
    
    //MARK: - bar action
    
    func barMiddleButtonAction() {
        self.resetBoard()
    }
    
}
