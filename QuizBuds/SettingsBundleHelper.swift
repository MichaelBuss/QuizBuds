//
//  SettingsBundleHelper.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 27/01/2019.
//  Copyright © 2019 NoobLabs. All rights reserved.
//

import Foundation

class SettingsBundleHelper {
    struct SettingsBundleKeys {
        static let darkAppearance = "Dark_Appearance"
        static let darkAppIcon = "Dark_App_Icon"
        static let syncDataWithIcloud = "Sync_Data_with_iCloud"
        static let resetApp = "Reset_App"
    }
    
//    class func checkAndExecuteSettings(){
//
//        if UserDefaults.standard.bool(forKey: SettingsBundleKeys.darkAppearance) {
//            print("Dark Appearance Requested")
//        }
//
//        if UserDefaults.standard.bool(forKey: SettingsBundleKeys.darkAppIcon) {
//            print("Dark App Icon Requested")
//        }
//
//        if UserDefaults.standard.bool(forKey: SettingsBundleKeys.syncDataWithIcloud) {
//            print("Sync Data with iCloud Requested")
//        }
//
//        if UserDefaults.standard.bool(forKey: SettingsBundleKeys.resetApp) {
//            UserDefaults.standard.set(false, forKey: SettingsBundleKeys.resetApp)
//            let appDomain: String? = Bundle.main.bundleIdentifier
//            UserDefaults.standard.removePersistentDomain(forName: appDomain!)
//            print("Reset App Requested")
//        }
//
//    }
    
}
