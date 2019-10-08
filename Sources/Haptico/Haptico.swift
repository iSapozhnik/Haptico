//
//  Haptico.swift
//  Haptico
//
//  Created by Ivan Sapozhnik on 02.03.18.
//

import UIKit

enum HapticoError: Error {
    case notSupportedByOS
    case notSupportedByDevice
    case notSupported
}

public enum HapticoNotification {
    case success
    case warning
    case error
}

public enum HapticoImpact {
    case light
    case medium
    case heavy
}

public protocol HapticoEngine {
    var logEnabled: Bool! { get set }
    func prepare() throws
    func generate(_ notification: HapticoNotification)
}

public final class Haptico {
    private static var sharedHaptico: Haptico = {
        let haptico = Haptico()
        return haptico
    }()
    
    private var engine: HapticoEngine? {
        let currentDevice = UIDevice.current
        var engine: HapticoEngine?
        
        if currentDevice.hasHapticFeedback {
            engine = HapticFeedbackNotificationEngine()
        } else if currentDevice.hasTapticEngine {
            engine = TapticEngine()
        } else {
            engine = nil
        }
        
        engine?.logEnabled = logEnabled
        return engine
    }
    
    private var patternEngine: PatternEngine?
    
    public var logEnabled: Bool = true
    
    public class func shared() -> Haptico {
        return sharedHaptico
    }
    
    public func prepare() throws {
        guard let engine = engine else {
            if logEnabled {
                print("Haptico 📳: Device name - \(UIDevice.current.deviceType.displayName)")
            }
            throw HapticoError.notSupported
        }
        try engine.prepare()
    }
    
    public func generate(_ feedbackNotification: HapticoNotification) {
        engine?.generate(feedbackNotification)
    }
    
    public func generate(_ impact: HapticoImpact) {
        guard let engine = self.engine as? HapticFeedbackNotificationEngine else { return }
        engine.generate(impact)
    }
    
    public func generateFeedbackFromPattern(_ pattern: String, delay: Double) {
        guard let engine = self.engine as? HapticFeedbackNotificationEngine else { return }
        
        if patternEngine == nil {
            patternEngine = PatternEngine(hapticEngine: engine)
        }
        
        guard let patternEngine = self.patternEngine, patternEngine.isFinished else { return }
        
        let pattern = HapticoPattern(pattern: pattern, delay: delay)
        patternEngine.pattern = pattern
        patternEngine.generate()
    }
}
