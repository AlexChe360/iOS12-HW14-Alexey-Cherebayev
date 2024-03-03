//
//  SceneDelegate.swift
//  iOS12-HW14-Alexey-Cherebayev
//
//  Created by  Alexey on 17.02.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let tabBarViewController = TabBarViewController()
        tabBarViewController.selectedIndex = 0
        window?.rootViewController = tabBarViewController
        window?.makeKeyAndVisible()
    }

}

