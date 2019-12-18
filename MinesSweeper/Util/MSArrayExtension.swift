//
//  MSArrayExtension.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/17.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return (0 ..< count).contains(index) ? self[index] : nil
    }
}
