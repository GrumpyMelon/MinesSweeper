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
    static let mineItemWidth = 30;
    static let appDelegate: AppDelegate = NSApplication.shared.delegate as! AppDelegate
}

class MSColor {
    static let itemNormalColor = NSColor.blue.withAlphaComponent(0.5)
    static let itemSelectedColor = NSColor.red.withAlphaComponent(0.5)
    static let itemNumberColor = NSColor.white
}
