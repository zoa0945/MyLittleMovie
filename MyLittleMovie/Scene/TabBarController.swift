//
//  TabBarController.swift
//  MyLittleMovie
//
//  Created by Mac on 2022/08/19.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let mainViewController: UIViewController = {
        let vc = UINavigationController(rootViewController: MainViewController())
        let tabBarItem = UITabBarItem(
            title: "영화",
            image: UIImage(systemName: "film.circle"),
            selectedImage: UIImage(systemName: "film.circle.fill"))
        vc.tabBarItem = tabBarItem
        
        return vc
    }()
    
    private let searchViewController: UIViewController = {
        let vc = SearchViewController()
        let tabBarItem = UITabBarItem(
            title: "검색",
            image: UIImage(systemName: "magnifyingglass.circle"),
            selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        vc.tabBarItem = tabBarItem
        
        return vc
    }()
    
    private let favoriteViewController: UIViewController = {
        let vc = UINavigationController(rootViewController: FavoriteViewController())
        let tabBarItem = UITabBarItem(
            title: "즐겨찾기",
            image: UIImage(systemName: "star"),
            selectedImage: UIImage(systemName: "star.fill"))
        vc.tabBarItem = tabBarItem
        
        return vc
    }()
    
    private let profileViewController: UIViewController = {
        let vc = UIViewController()
        let tabBarItem = UITabBarItem(
            title: "프로필",
            image: UIImage(systemName: "person.crop.circle"),
            selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        vc.tabBarItem = tabBarItem
        
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [mainViewController, searchViewController, favoriteViewController, profileViewController]
    }
}

