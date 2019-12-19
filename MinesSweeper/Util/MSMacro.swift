//
//  File.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/9.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Foundation
import AppKit

class MSMacro {
    static let mineItemWidth = 30.0;
    static let appDelegate: AppDelegate = NSApplication.shared.delegate as! AppDelegate
    static let topBarHeight = 60.0;
    static let windowOrigin = NSPoint(x: 700, y: 500)
    class func boardSize(row: Int, col: Int) -> NSSize  {
        return NSSize(width: mineItemWidth * Double(col), height: mineItemWidth * Double(row))
    }
}

class MSColor {
    static let itemNormalColor = NSColor.lightGray.withAlphaComponent(0.5)
    static let itemMaskColor = NSColor.blue.withAlphaComponent(0.5)
    static let itemNumberColor = NSColor.white
}
