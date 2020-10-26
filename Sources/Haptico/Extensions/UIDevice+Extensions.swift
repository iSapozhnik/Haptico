//
//  UIDevice+Extensions.swift
//  Haptico
//
//  Created by Ivan Sapozhnik on 02.03.18.
//

import UIKit

// https://github.com/schickling/Device.swift/blob/master/Device/UIDeviceExtension.swift
// https://ipsw.me/otas
// MARK: -
internal extension UIDevice {
    
    /// Returns the `DeviceType` of the device in use
    internal var deviceType: DeviceType {
        return DeviceType.current
    }
    
    internal var hasTapticEngine: Bool {
        get {
            return deviceType == .iPhone6S || deviceType == .iPhone6SPlus ||
                deviceType == .iPhone7 || deviceType == .iPhone7Plus ||
                deviceType == .iPhone8 || deviceType == .iPhone8Plus ||
                deviceType == .iPhoneX || deviceType == .iPhoneXR ||
                deviceType == .iPhoneXS || deviceType == .iPhoneXSMax ||
                deviceType == .iPhone11 || deviceType == .iPhone11Pro ||
                deviceType == .iPhone11ProMax || deviceType == .iPhoneSEGen2 ||
                deviceType == .iPhone12Mini ||  deviceType == .iPhone12 ||
                deviceType == .iPhone12Pro  ||  deviceType == .iPhone12ProMax
        }
    }
    
    internal var hasHapticFeedback: Bool {
        get {
            return deviceType == .iPhone7 || deviceType == .iPhone7Plus ||
                deviceType == .iPhone8 || deviceType == .iPhone8Plus ||
                deviceType == .iPhoneX || deviceType == .iPhoneXR ||
                deviceType == .iPhoneXS || deviceType == .iPhoneXSMax ||
                deviceType == .iPhone11 || deviceType == .iPhone11Pro ||
                deviceType == .iPhone11ProMax || deviceType == .iPhoneSEGen2 ||
                deviceType == .iPhone12Mini ||  deviceType == .iPhone12 ||
                deviceType == .iPhone12Pro  ||  deviceType == .iPhone12ProMax
        }
    }
}

/// Enum representing the different types of iOS devices available
internal enum DeviceType: String {
    case iPhone2G
    
    case iPhone3G
    case iPhone3GS
    
    case iPhone4
    case iPhone4S
    
    case iPhone5
    case iPhone5C
    case iPhone5S
    
    case iPhone6
    case iPhone6Plus
    
    case iPhone6S
    case iPhone6SPlus
    
    case iPhoneSE
    
    case iPhone7
    case iPhone7Plus
    
    case iPhone8
    case iPhone8Plus
    
    case iPhoneX
    case iPhoneXS
    case iPhoneXSMax
    case iPhoneXR
    
    case iPhone11
    case iPhone11Pro
    case iPhone11ProMax

    case iPhoneSEGen2
    
    case iPhone12Mini
    case iPhone12
    case iPhone12Pro
    case iPhone12ProMax
    
    case iPodTouch1G
    case iPodTouch2G
    case iPodTouch3G
    case iPodTouch4G
    case iPodTouch5G
    case iPodTouch6G
    
    case iPad
    case iPad2
    case iPad3
    case iPad4
    case iPadMini
    case iPadMiniRetina
    case iPadMini3
    case iPadMini4
    
    case iPadAir
    case iPadAir2
    
    case iPadPro9Inch
    case iPadPro10p5Inch
    case iPadPro11Inch
    case iPadPro12Inch
    
    case simulator
    case notAvailable
    
    // MARK: - Constants
    /// Returns the current device type
    internal static var current: DeviceType {
        
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machine = systemInfo.machine
        let mirror = Mirror(reflecting: machine)
        var identifier = ""
        
        for child in mirror.children {
            if let value = child.value as? Int8, value != 0 {
                identifier.append(String(UnicodeScalar(UInt8(value))))
            }
        }
        
        return DeviceType(identifier: identifier)
    }
    
    // MARK: Variables
    /// Returns the display name of the device type
    internal var displayName: String {
        switch self {
        case .iPhone2G: return "iPhone 2G"
        case .iPhone3G: return "iPhone 3G"
        case .iPhone3GS: return "iPhone 3GS"
        case .iPhone4: return "iPhone 4"
        case .iPhone4S: return "iPhone 4S"
        case .iPhone5: return "iPhone 5"
        case .iPhone5C: return "iPhone 5C"
        case .iPhone5S: return "iPhone 5S"
        case .iPhone6Plus: return "iPhone 6 Plus"
        case .iPhone6: return "iPhone 6"
        case .iPhone6S: return "iPhone 6S"
        case .iPhone6SPlus: return "iPhone 6S Plus"
        case .iPhoneSE: return "iPhone SE"
        case .iPhone7: return "iPhone 7"
        case .iPhone7Plus: return "iPhone 7 Plus"
        case .iPhone8: return "iPhone 8"
        case .iPhone8Plus: return "iPhone 8 Plus"
        case .iPhoneX: return "iPhone X"
        case .iPhoneXS: return "iPHone XS"
        case .iPhoneXSMax: return "iPhone XS Max"
        case .iPhoneXR: return "iPhone XR"
        case .iPhone11: return "iPhone 11"
        case .iPhone11Pro: return "iPhone 11 Pro"
        case .iPhone11ProMax: return "iPhone 11 Pro Max"
        case .iPhoneSEGen2: return "iPhone SE (2nd Gen)"
        case .iPhone12Mini: return "iPhone 12 Mini"
        case .iPhone12: return "iPhone 12"
        case .iPhone12Pro: return "iPhone 12 Pro"
        case .iPhone12ProMax: return "iPhone 12 Pro Max"
        case .iPodTouch1G: return "iPod Touch 1G"
        case .iPodTouch2G: return "iPod Touch 2G"
        case .iPodTouch3G: return "iPod Touch 3G"
        case .iPodTouch4G: return "iPod Touch 4G"
        case .iPodTouch5G: return "iPod Touch 5G"
        case .iPodTouch6G: return "iPod Touch 6G"
        case .iPad: return "iPad"
        case .iPad2: return "iPad 2"
        case .iPad3: return "iPad 3"
        case .iPad4: return "iPad 4"
        case .iPadMini: return "iPad Mini"
        case .iPadMiniRetina: return "iPad Mini Retina"
        case .iPadMini3: return "iPad Mini 3"
        case .iPadMini4: return "iPad Mini 4"
        case .iPadAir: return "iPad Air"
        case .iPadAir2: return "iPad Air 2"
        case .iPadPro9Inch: return "iPad Pro 9 Inch"
        case .iPadPro10p5Inch: return "iPad Pro 10.5 Inch"
        case .iPadPro11Inch: return "iPad Pro 11 Inch"
        case .iPadPro12Inch: return "iPad Pro 12 Inch"
        case .simulator: return "Simulator"
        case .notAvailable: return "Not Available"
        }
    }
    
    internal var identifiers: [String] {
        
        switch self {
        case .notAvailable: return []
        case .simulator: return ["i386", "x86_64"]
            
        case .iPhone2G: return ["iPhone1,1"]
        case .iPhone3G: return ["iPhone1,2"]
        case .iPhone3GS: return ["iPhone2,1"]
        case .iPhone4: return ["iPhone3,1", "iPhone3,2", "iPhone3,3"]
        case .iPhone4S: return ["iPhone4,1"]
        case .iPhone5: return ["iPhone5,1", "iPhone5,2"]
        case .iPhone5C: return ["iPhone5,3", "iPhone5,4"]
        case .iPhone5S: return ["iPhone6,1", "iPhone6,2"]
        case .iPhone6: return ["iPhone7,2"]
        case .iPhone6Plus: return ["iPhone7,1"]
        case .iPhone6S: return ["iPhone8,1"]
        case .iPhone6SPlus: return ["iPhone8,2"]
        case .iPhoneSE: return ["iPhone8,4"]
        case .iPhone7: return ["iPhone9,1", "iPhone9,3"]
        case .iPhone7Plus: return ["iPhone9,2", "iPhone9,4"]
        case .iPhone8: return ["iPhone10,1", "iPhone10,4"]
        case .iPhone8Plus: return ["iPhone10,2", "iPhone10,5"]
        case .iPhoneX: return ["iPhone10,3", "iPhone10,6"]
        case .iPhoneXS: return ["iPhone11,2"]
        case .iPhoneXSMax: return ["iPhone11,4", "iPhone11,6"]
        case .iPhoneXR: return ["iPhone11,8"]
        case .iPhone11: return ["iPhone12,1"]
        case .iPhone11Pro: return ["iPhone12,3"]
        case .iPhone11ProMax: return ["iPhone12,5"]
        case .iPhoneSEGen2: return ["iPhone12,8"]
        case .iPhone12Mini: return ["iPhone13,1"]
        case .iPhone12: return ["iPhone13,2"]
        case .iPhone12Pro: return ["iPhone13,3"]
        case .iPhone12ProMax: return ["iPhone13,4"]

        case .iPodTouch1G: return ["iPod1,1"]
        case .iPodTouch2G: return ["iPod2,1"]
        case .iPodTouch3G: return ["iPod3,1"]
        case .iPodTouch4G: return ["iPod4,1"]
        case .iPodTouch5G: return ["iPod5,1"]
        case .iPodTouch6G: return ["iPod7,1"]
            
        case .iPad: return ["iPad1,1", "iPad1,2"]
        case .iPad2: return ["iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4"]
        case .iPad3: return ["iPad3,1", "iPad3,2", "iPad3,3"]
        case .iPad4: return ["iPad3,4", "iPad3,5", "iPad3,6"]
        case .iPadMini: return ["iPad2,5", "iPad2,6", "iPad2,7"]
        case .iPadMiniRetina: return ["iPad4,4", "iPad4,5", "iPad4,6"]
        case .iPadMini3: return ["iPad4,7", "iPad4,8", "iPad4,9"]
        case .iPadMini4: return ["iPad5,1", "iPad5,2"]
        case .iPadAir: return ["iPad4,1", "iPad4,2", "iPad4,3"]
        case .iPadAir2: return ["iPad5,3", "iPad5,4"]
        case .iPadPro9Inch: return ["iPad6,3", "iPad6,4"]
        case .iPadPro10p5Inch: return ["iPad7,3", "iPad7,4"]
        case .iPadPro11Inch: return ["iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4"]
        case .iPadPro12Inch: return ["iPad6,7", "iPad6,8", "iPad7,1", "iPad7,2", "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8"]
        }
    }
    
    // MARK: - Inits
    /** Creates a device type
     - parameter identifier: The identifier of the device
     - returns: The device type based on the provided identifier
     */
    internal init(identifier: String) {
        
        for device in DeviceType.all {
            for deviceId in device.identifiers {
                guard identifier == deviceId else { continue }
                self = device
                return
            }
        }
        
        self = .notAvailable
    }
}

extension DeviceType {
    static var all: [DeviceType] {
        return [
        iPhone2G,
        iPhone3G,
        iPhone3GS,
        iPhone4,
        iPhone4S,
        iPhone5,
        iPhone5C,
        iPhone5S,
        iPhone6,
        iPhone6Plus,
        iPhone6S,
        iPhone6SPlus,
        iPhoneSE,
        iPhone7,
        iPhone7Plus,
        iPhone8,
        iPhone8Plus,
        iPhoneX,
        iPhoneXS,
        iPhoneXSMax,
        iPhoneXR,
        iPhone11,
        iPhone11Pro,
        iPhone11ProMax,
        iPhone12Mini,
        iPhone12,
        iPhone12Pro,
        iPhone12ProMax,
        iPhoneSEGen2,
        iPodTouch1G,
        iPodTouch2G,
        iPodTouch3G,
        iPodTouch4G,
        iPodTouch5G,
        iPodTouch6G,
        iPad,
        iPad2,
        iPad3,
        iPad4,
        iPadMini,
        iPadMiniRetina,
        iPadMini3,
        iPadMini4,
        iPadAir,
        iPadAir2,
        iPadPro9Inch,
        iPadPro10p5Inch,
        iPadPro11Inch,
        iPadPro12Inch,
        simulator,
        notAvailable
        ]
    }
}
