//
//  HapticFeedbackEngine.swift
//  Haptico
//
//  Created by Ivan Sapozhnik on 02.03.18.
//

import UIKit

final class HapticFeedbackNotificationEngine: HapticoEngine {
    var logEnabled: Bool!
    
    @available(iOS 10.0, *)
    private var generator: UINotificationFeedbackGenerator {
        return UINotificationFeedbackGenerator()
    }
    
    @available(iOS 10.0, *)
    private var impactGenerator: (light: UIImpactFeedbackGenerator, medium: UIImpactFeedbackGenerator, heavy: UIImpactFeedbackGenerator) {
        return (light: UIImpactFeedbackGenerator(style: .light), medium: UIImpactFeedbackGenerator(style: .medium), heavy: UIImpactFeedbackGenerator(style: .heavy))
    }

    func prepare() throws {
        guard #available(iOS 10, *) else { throw HapticoError.notSupportedByOS }
        guard UIDevice.current.hasHapticFeedback else { throw HapticoError.notSupportedByDevice }
        
        generator.prepare()
        impactGenerator.heavy.prepare()
        impactGenerator.medium.prepare()
        impactGenerator.light.prepare()
    }
    
    func generate(_ notification: HapticoNotification) {
        guard #available(iOS 10, *) else { return }
        guard UIDevice.current.hasHapticFeedback else { return }
        
        switch notification {
        case .success:
            generator.notificationOccurred(.success)
        case .warning:
            generator.notificationOccurred(.warning)
        case .error:
            generator.notificationOccurred(.error)
        }
    }
    
    func generate(_ impact: HapticoImpact) {
        guard #available(iOS 10, *) else { return }
        guard UIDevice.current.hasHapticFeedback else { return }
        
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
