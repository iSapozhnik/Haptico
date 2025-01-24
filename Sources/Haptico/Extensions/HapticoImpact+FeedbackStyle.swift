import UIKit

internal extension HapticoImpact {
    
    var feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle {
        switch self {
        case .light:
            return .light
        case .medium:
            return .medium
        case .heavy:
            return .heavy
        case .rigid:
            if #available(iOS 13.0, *) {
                return .rigid
            } else {
                return .medium
            }
        case .soft:
            if #available(iOS 13.0, *) {
                return .soft
            } else {
                return .light
            }
        }
    }
    
}
