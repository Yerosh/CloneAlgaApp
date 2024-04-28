//
//  TabBarController.swift
//  Final(AlgaApp)
//
//  Created by Yernur Adilbek on 11/25/23.
//
import SnapKit
import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        selectedIndex = 0
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = UIColor(red: 0, green: 155/255, blue: 247/255, alpha: 1)
    }
    
    //MARK: - Tab Setup
    private func setupTabs(){
        let home = self.createNav(title: "Home", image: UIImage(systemName: "house"), vc: ViewController())
        let shop = self.createNav(title: "Shop", image: UIImage(systemName: "bag"), vc: ShopViewController())
        let message = self.createNav(title: "Message", image: UIImage(systemName: "ellipsis.message"), vc: MessageViewController())
        let profile = self.createNav(title: "Profile", image: UIImage(systemName: "person"), vc: ProfileViewController())
        self.setViewControllers([home, shop, message, profile], animated: true)
    }
    
    private func createNav(title: String, image: UIImage?, vc: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title
        
        if title == "Profile" {
            nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: nil, action: #selector(openSettings))
        }
        return nav
    }
    
    @objc private func openSettings() {
        if let navigationController = self.selectedViewController as? UINavigationController {
            let settingsViewController = SettingsViewController()
            navigationController.pushViewController(settingsViewController, animated: true)
        }
    }
}
