//
//  PatternEngine.swift
//  Haptico
//
//  Created by Ivan Sapozhnik on 3/2/18.
//

import Foundation

class PatternEngine {
    private enum PatternChar: Character {
        case space = "-"
        case signalHeavy = "O"
        case signalMedium = "o"
        case signalLight = "."
    }
    
    private var engine: HapticFeedbackNotificationEngine?
    
    var isFinished: Bool {
        return queue.operationCount == 0
    }
    
    lazy var queue: OperationQueue = {
        var queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    var pattern: HapticoPattern!
    
    init(hapticEngine: HapticFeedbackNotificationEngine?) {
        self.engine = hapticEngine
    }
    
    func generate() {
        for (index, character) in pattern.pattern.enumerated() {
            if character == PatternChar.space.rawValue {
                queue.addOperation(PauseOperation(delay: pattern.delay))
            } else if character == PatternChar.signalHeavy.rawValue {
                queue.addOperation(SignalOperation(hapticEngine: engine, impact: .heavy))
            } else if character == PatternChar.signalMedium.rawValue {
                queue.addOperation(SignalOperation(hapticEngine: engine, impact: .medium))
            } else if character == PatternChar.signalLight.rawValue {
                queue.addOperation(SignalOperation(hapticEngine: engine, impact: .light))
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

class SignalOperation: Operation {
    weak var engine: HapticFeedbackNotificationEngine?
    private var impact: HapticoImpact
    init(hapticEngine: HapticFeedbackNotificationEngine?, impact: HapticoImpact) {
        self.engine = hapticEngine
        self.impact = impact
    }
    
    override func main() {
        guard #available(iOS 10, *) else { return }
        DispatchQueue.main.async {
            self.engine?.generate(self.impact)
        }
        Thread.sleep(forTimeInterval: 0.1)
    }
}
