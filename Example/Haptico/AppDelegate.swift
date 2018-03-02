//
//  AppDelegate.swift
//  Haptico
//
//  Created by isapozhnik on 03/02/2018.
//  Copyright (c) 2018 isapozhnik. All rights reserved.
//

import UIKit
import Haptico

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        do {
            let haptico = Haptico.shared()
            try haptico.prepare()
        } catch {
            print(error)
        }
        
        return true
    }
}

