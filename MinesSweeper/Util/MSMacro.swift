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
    class func rgbColor(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> NSColor {
        return NSColor.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1)
    }
    static let numberColor: Dictionary<Int, NSColor> = [
        1 : NSColor.blue,
        2 : NSColor.green,
        3 : NSColor.red,
        4 : MSColor.rgbColor(70.0, 0, 185.0),
        5 : MSColor.rgbColor(186.0, 0, 70.0),
        6 : MSColor.rgbColor(0, 70.0, 186.0),
        7 : MSColor.rgbColor(0, 186.0, 186.0),
        8 : MSColor.rgbColor(186.0, 186.0, 0),
    ]
}
