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
    
    var isFinished: Bool {
        return queue.operationCount == 0
    }
    var pattern: HapticoPattern!

    lazy var queue: OperationQueue = {
        var queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    private var engine: HapticFeedbackNotificationEngine?
    private var pauseDuration: TimeInterval
    
    init(hapticEngine: HapticFeedbackNotificationEngine?, pauseDuration: TimeInterval = 0.11) {
        self.engine = hapticEngine
        self.pauseDuration = pauseDuration
    }
    
    func generate() {
        for (_, character) in pattern.pattern.enumerated() {
            if character == PatternChar.space.rawValue {
                queue.addOperation(PauseOperation(delay: pattern.delay))
            } else if character == PatternChar.signalHeavy.rawValue {
                queue.addOperation(SignalOperation(hapticEngine: engine, impact: .heavy, pauseDuration: pauseDuration))
            } else if character == PatternChar.signalMedium.rawValue {
                queue.addOperation(SignalOperation(hapticEngine: engine, impact: .medium, pauseDuration: pauseDuration))
            } else if character == PatternChar.signalLight.rawValue {
                queue.addOperation(SignalOperation(hapticEngine: engine, impact: .light, pauseDuration: pauseDuration))
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
    private var pauseDuration: TimeInterval
    
    init(hapticEngine: HapticFeedbackNotificationEngine?, impact: HapticoImpact, pauseDuration: TimeInterval) {
        self.engine = hapticEngine
        self.impact = impact
        self.pauseDuration = pauseDuration
    }
    
    override func main() {
        guard #available(iOS 10, *) else { return }
        DispatchQueue.main.async {
            self.engine?.generate(self.impact)
        }
        Thread.sleep(forTimeInterval: pauseDuration)
    }
}
