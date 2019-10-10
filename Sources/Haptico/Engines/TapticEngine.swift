//
//  TapticEngine.swift
//  Haptico
//
//  Created by Ivan Sapozhnik on 02.03.18.
//

import UIKit
import AudioToolbox.AudioServices

final class TapticEngine: HapticoEngine {
    struct SoundID {
        static let successID = SystemSoundID(1519)
        static let warningID = SystemSoundID(1102)
        static let errorID = SystemSoundID(1107)
    }
    
    var logEnabled: Bool!
    
    func prepare() throws {
        guard #available(iOS 9, *) else { throw HapticoError.notSupportedByOS }
        guard UIDevice.current.hasTapticEngine else { throw HapticoError.notSupportedByDevice }
    }
    
    func generate(_ notification: HapticoNotification) {
        guard #available(iOS 9, *) else { return }
        guard UIDevice.current.hasTapticEngine else { return }
        
        switch notification {
        case .success:
            AudioServicesPlaySystemSoundWithCompletion(SoundID.successID, nil)
        case .warning:
            AudioServicesPlaySystemSoundWithCompletion(SoundID.warningID, nil)
        case .error:
            AudioServicesPlaySystemSoundWithCompletion(SoundID.errorID, nil)
        }
    }
}
