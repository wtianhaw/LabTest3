//
//  BaseTabBarController.swift
//  LabTest
//
//  Created by Wong Tian Haw on 29/06/2022.
//

import UIKit

final class BaseTabBarController: UITabBarController {
    
    var selectedTab: Int = 0
    
    convenience init(selectedTab: Int) {
        self.init()
        self.selectedTab = selectedTab
        self.selectedIndex = selectedTab
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        let searchVC = BaseNavigationController(rootViewController: SearchWeatherVC())
        let webVC = BaseNavigationController(rootViewController: CommonWebViewController())
    
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "icon_search"), tag: 0)
        webVC.tabBarItem = UITabBarItem(title: "Web", image: UIImage(named: "icon_search"), tag: 1)
        
        self.selectedIndex = selectedTab
        self.viewControllers = [searchVC, webVC]
    }
    
    private func setupUI() {
        self.tabBar.backgroundColor = .systemGray
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.shadowImage = UIImage()
        self.tabBar.tintColor = .systemBlue
    }

}
