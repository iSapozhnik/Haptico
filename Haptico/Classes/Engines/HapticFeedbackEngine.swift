//
//  HapticFeedbackEngine.swift
//  Haptico
//
//  Created by Ivan Sapozhnik on 02.03.18.
//

import Foundation

final class HapticFeedbackNotificationEngine: HapticoEngine {
    var logEnabled: Bool!
    
    @available(iOS 10.0, *)
    private var generator: UINotificationFeedbackGenerator {
        return UINotificationFeedbackGenerator()
    }

    func prepare() throws {
        guard #available(iOS 10, *) else { throw HapticoError.notSupportedByOS }
        guard UIDevice.current.hasHapticFeedback else { throw HapticoError.notSupportedByDevice }
        
        generator.prepare()
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
}
