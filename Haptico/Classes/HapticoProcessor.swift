//
//  HapticoProcessor.swift
//  Haptico
//
//  Created by Ivan Sapozhnik on 3/2/18.
//

import Foundation

class HapticoProcessor {
    
    private enum PatternChar: Character {
        case space = "-"
        case signal = "0"
    }
    
    lazy var queue: OperationQueue = {
        var queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    var pattern: HapticoPattern
    init(pattern: HapticoPattern) {
        self.pattern = pattern
    }
    
    func process() {
        for (index, character) in pattern.pattern.enumerated() {
            print("found \'\(character)\' at index \(index)")
            if character == PatternChar.space.rawValue {
                queue.addOperation(PauseOperation(delay: pattern.delay))
            } else if character == PatternChar.signal.rawValue {
                queue.addOperation(SigmalOperation(delay: 0.05))
            }
        }
    }
}

class PauseOperation: Operation {
    private var delay: Double
    
    init(delay: Double) {
        self.delay = delay
    }
    
    override func main() {
        Thread.sleep(forTimeInterval: delay)
    }
}

class SigmalOperation: Operation {
    private var delay: Double
    
    init(delay: Double) {
        self.delay = delay
    }
    
    override func main() {
        FMSynthesizer.sharedSynth().play(3000.0, modulatorFrequency: 2000.0, modulatorAmplitude: 1.0)
        Thread.sleep(forTimeInterval: delay)
        FMSynthesizer.sharedSynth().stop()
    }
}
