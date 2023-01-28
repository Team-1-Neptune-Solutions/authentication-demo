//
//  firebaseLoginDemoApp.swift
//  firebaseLoginDemo
//
//  Created by AKSHAY MAHAJAN on 2023-01-20.
//

import SwiftUI
import Firebase
//import FirebaseCore
//import FirebaseAuth

//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//    return true
//  }
//}


@main
struct firebaseLoginDemoApp: App {
    // register app delegate for Firebase setup
//      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
