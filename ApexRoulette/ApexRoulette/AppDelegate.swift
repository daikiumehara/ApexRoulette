//
//  AppDelegate.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/06/17.
//  Copyright © 2023 Daiki Umehara. All rights reserved.
//

import Foundation
import GoogleMobileAds
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    GADMobileAds.sharedInstance().start(completionHandler: nil)

    return true
  }

}
