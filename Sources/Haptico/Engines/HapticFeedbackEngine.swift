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
    private var selectionGenerator: UISelectionFeedbackGenerator {
        return UISelectionFeedbackGenerator()
    }
    
    @available(iOS 10.0, *)
    private let impactGenerators: [UIImpactFeedbackGenerator] = {
        HapticoImpact.allCases.map({ UIImpactFeedbackGenerator(style: $0.feedbackStyle) })
    }()

    func prepare() throws {
        guard #available(iOS 10, *) else { throw HapticoError.notSupportedByOS }
        guard UIDevice.current.hasHapticFeedback else { throw HapticoError.notSupportedByDevice }
        
        generator.prepare()
        selectionGenerator.prepare()
        impactGenerators.forEach({ $0.prepare() })
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
        
        guard let index = HapticoImpact.allCases.firstIndex(of: impact) else { return }
        let generator = impactGenerators[index]
        generator.impactOccurred()
    }
    
    func selectionChanged() {
        guard #available(iOS 10, *) else { return }
        guard UIDevice.current.hasHapticFeedback else { return }
        
        selectionGenerator.selectionChanged()
    }
}
