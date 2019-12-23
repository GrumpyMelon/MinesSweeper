//
//  File.swift
//  MinesSweeper
//
//  Created by 杨阳 on 2019/12/23.
//  Copyright © 2019 杨阳. All rights reserved.
//

import Foundation

extension Dictionary {
    subscript(safe key: Key?) -> Value? {
        return (key != nil && self.keys.contains(key!)) ? self[key!] : self.values.first
    }
}
