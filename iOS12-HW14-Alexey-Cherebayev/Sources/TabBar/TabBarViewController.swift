//
//  TabBarViewController.swift
//  iOS12-HW14-Alexey-Cherebayev
//
//  Created by  Alexey on 17.02.2024.
//

import UIKit

class TabBarViewController: UITabBarController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setups
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .systemBlue
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        viewControllers = [
            createNavController(for: LibraryViewController(), title: NSLocalizedString("Library", comment: ""), image: UIImage(systemName: "photo.fill.on.rectangle.fill")!),
            createNavController(for: ForYouViewController(), title: NSLocalizedString("For You", comment: ""), image: UIImage(systemName: "heart.text.square.fill")!),
            createNavController(for: AlbumsViewController(), title: NSLocalizedString("Albums", comment: ""), image: UIImage(systemName: "rectangle.stack.fill")!),
            createNavController(for: SearchViewController(), title: NSLocalizedString("Search", comment: ""), image: UIImage(systemName: "magnifyingglass")!)
        ]
    }
    
    // MARK: - Functions
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }

}
