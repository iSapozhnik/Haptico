//
//  UIButton+Haptico.swift
//  Haptico
//
//  Created by Ivan Sapozhnik on 02.03.18.
//

import UIKit

class HapticoButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addTarget(self, action: #selector(didPress), for: .touchDown)
        addTarget(self, action: #selector(didRelease), for: .touchUpInside)
        addTarget(self, action: #selector(didRelease), for: .touchUpOutside)
    }
    
    @objc private func didPress() {
        Haptico.shared().generate(.heavy)
    }
    
    @objc private func didRelease() {
        Haptico.shared().generate(.light)
    }
}
