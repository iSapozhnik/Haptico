//
//  Haptico.swift
//  Haptico
//
//  Created by Ivan Sapozhnik on 02.03.18.
//

import Foundation

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
    
    @available(iOS 10.0, *)
    private var impactGenerator: (light: UIImpactFeedbackGenerator, medium: UIImpactFeedbackGenerator, heavy: UIImpactFeedbackGenerator) {
        return (light: UIImpactFeedbackGenerator(style: .light), medium: UIImpactFeedbackGenerator(style: .medium), heavy: UIImpactFeedbackGenerator(style: .heavy))
    }
    
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
    
    public func generateImpact(_ impact: HapticoImpact) {
        guard #available(iOS 10, *) else { return }
        switch impact {
        case .light:
            impactGenerator.light.impactOccurred()
        case .medium:
            impactGenerator.medium.impactOccurred()
        case .heavy:
            impactGenerator.heavy.impactOccurred()
        }
    }
}
