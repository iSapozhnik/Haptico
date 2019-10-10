//
//  UIAlertController+Haptico.swift
//  Haptico
//
//  Created by Ivan Sapozhnik on 02.03.18.
//

import UIKit

extension UIViewController {
    public func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, hapticNotification: HapticoNotification, completion: (() -> Void)? = nil) {
        present(viewControllerToPresent, animated: flag, completion: completion)
        Haptico.shared().generate(hapticNotification)
    }
}
