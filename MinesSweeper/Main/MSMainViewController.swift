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
    var itemViewArray: Array<Array<MSMineItemView>>!
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
        
        itemViewArray = Array();
        self.setUpBoard()
    }
    
//MARK: - clean & set &reset
    
    func cleanBoard() {
        for i in 0 ..< itemViewArray.count {
            //todo: optimise loop here
            let subArray = itemViewArray[i]
            for item in subArray {
                item.removeFromSuperview()
            }
        }
        itemViewArray.removeAll()
    }
    
    func setUpBoard() {
        configModel()
        configViewLayout()
        configMines()
        self.setBoardStatus(.Default)
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
            var itemArray = Array<MSMineItemView>()
            for j in 0 ..< viewModel.boardConfig.boardCol {
                let origin = CGPoint(x:Double(j) * MSMacro.mineItemWidth, y:Double(i) * MSMacro.mineItemWidth)
                let size = CGSize(width: MSMacro.mineItemWidth, height: MSMacro.mineItemWidth)
                let frame = NSRect(origin: origin, size: size)
                
                let item: MSMineItemView = MSMineItemFactory.createItemView(model: viewModel.itemsModelArray[i][j], frame: frame)
                boardView.addSubview(item)
                itemArray.append(item)
                //todo: 循环引用问题？
                item.buttonAction = {() -> Void in
                    self.itemActoin(item: item,index: (i, j))
                }
            }
            itemViewArray.append(itemArray)
        }
    }
    
    //MARK: - config status
    
    func setBoardStatus(_ status: MSBoardStatus) {
        self.viewModel.status = status
        self.topBarView.boardStatus = self.viewModel.status
    }
    
    //MARK: - bar action
    
    func barMiddleButtonAction() {
        self.resetBoard()
    }
    
    //MARK: - item action
    
    func itemActoin(item: MSMineItemView, index: (i: Int, j: Int)) {
        switch item.viewModel.itemType {
        case .Mine:
            self.setBoardStatus(.Fail)
        case .Number:
            if item.viewModel.minesNumber == 0 {
                self.revealBlankItemAround(index.i, index.j)
            } else {
                // do nothing
            }
        }
    }
    
    func revealBlankItemAround(_ i: Int, _ j: Int) {
        let item: MSMineItemView? = self.itemViewArray[safe: i]?[safe: j]
        let needReveal: Bool = (item != nil && !item!.revealed && item!.viewModel.itemType == .Number)
        let needRecursiveReveal: Bool = (needReveal && item!.viewModel.minesNumber == 0)
        
        if !needReveal {
            //Not a blank item, then return.
            return
        }
        //Reveal blank item and number item
        item!.revealItem()
        if !needRecursiveReveal {
            return;
        }
        //Recursively reveal blank item
        
        //Only four items
        //todo： if current item is blank, would the diagonal one be reevealed?
        let needBeRevealedItems: Array<(Int, Int)> = [(i, j - 1), (i - 1, j), (i + 1, j), (i, j + 1)]
        for (iIndex, jIndex) in needBeRevealedItems {
            //Recursively reveal item around current item
            self.revealBlankItemAround(iIndex, jIndex)
        }
    }
}
