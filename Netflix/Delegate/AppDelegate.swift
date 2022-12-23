//
//  AppDelegate.swift
//  Netflix
//
//  Created by unicred on 20/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		let navigationView = UINavigationController(rootViewController: ViewController())
		
		navigationView.navigationBar.tintColor = .white
		
		window?.rootViewController = navigationView
		window?.makeKeyAndVisible()
		
		return true
	}
}

