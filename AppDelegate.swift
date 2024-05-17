//
//  AppDelegate.swift
//  AIExpenseTracker
//
//  Created by Aydın KAYA on 13.05.2024.
//

import Firebase
import FirebaseFirestore
import Foundation


#if os(macOS)
import Cocoa
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationWillFinishLaunching(_ notification: Notification) {
        setupFirebase()
    }
}

#else
import UIKit
class AppDelegate: NSObject, UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupFirebase()
        return true
    }
}

#endif


// MACOS using NS other UI delegate

fileprivate func isPreviewRunTime() -> Bool {
    
    ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}

fileprivate func setupFirebase(){
    FirebaseApp.configure()
    if isPreviewRunTime(){
        let settings = Firestore.firestore().settings
        settings.host = "localhost:8080"
        settings.isPersistenceEnabled = false
        settings.isSSLEnabled = false  // Using HTTP
        
        Firestore.firestore().settings = settings
    }
}
