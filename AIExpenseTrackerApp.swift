//
//  AIExpenseTrackerApp.swift
//  AIExpenseTracker
//
//  Created by Aydın KAYA on 10.05.2024.
//

import SwiftUI

    @main
    struct AIExpenseTrackerApp: App {
        
        #if os(macOS)
        @NSApplicationDelegateAdaptor private var appDelegate: AppDelegate
        #else
        @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
        #endif
        
        var body: some Scene {
            WindowGroup {
                ContentView()
                #if os(macOS)
                    .frame(minWidth: 729, minHeight: 480)
                #endif
            }
            
            #if os(macOS)
            .windowResizability(.contentMinSize)
            #endif
            
        }
    }
