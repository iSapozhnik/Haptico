//
//  HapticoProcessor.swift
//  Haptico
//
//  Created by Ivan Sapozhnik on 3/2/18.
//

import Foundation

class HapticoProcessor {
    
    private enum PatternChar: String {
        case space = "-"
        case signal = "0"
    }
    
    var pattern: HapticoPattern
    init(pattern: HapticoPattern) {
        self.pattern = pattern
    }
    
    func process() {
        for (index, character) in pattern.pattern.enumerated() {
            print("found \'\(character)\' at index \(index)")
        }
    }
}
