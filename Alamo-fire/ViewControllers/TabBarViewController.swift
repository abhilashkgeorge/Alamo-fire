//
//  TabBarViewController.swift
//  Alamo-fire
//
//  Created by Abhilash k George on 23/05/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let sb = UIStoryboard(name: "Home", bundle: nil)
        let homeVC = sb.instantiateViewController(withIdentifier: "HomeViewController")
//        self.present(vc, animated: true, completion: nil)
//        let homeVC = HomeViewController()
        let qrVC = QRViewController()
        let favouritesVC = FavouritesViewController()
        let notificationsVC = NotificationsViewController()
        view.backgroundColor = .white

        self.setViewControllers([homeVC, qrVC, favouritesVC, notificationsVC], animated: false)

        
        guard let items = self.tabBar.items else {
            return
        }
        
        let images = [UIImage.AssetImages.home.rawValue,
                      UIImage.AssetImages.qr.rawValue,
                      UIImage.AssetImages.favorite  .rawValue,
                      UIImage.AssetImages.alarm.rawValue]
        
        for value in 0...items.count - 1 {
            items[value].image = UIImage(named: images[value])
        }
        
        
        self.tabBar.unselectedItemTintColor = UIColor.tabBarGrey
        self.tabBar.tintColor = UIColor.tabBarNavy
        
        
    }
}
