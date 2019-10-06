//
//  HapticoPattern.swift
//  Haptico
//
//  Created by Ivan Sapozhnik on 3/2/18.
//

import Foundation

public class HapticoPattern {
    var pattern: String
    var delay: Double
    
    init(pattern: String, delay: Double = 0.02) {
        self.pattern = pattern
        self.delay = delay
    }
}
