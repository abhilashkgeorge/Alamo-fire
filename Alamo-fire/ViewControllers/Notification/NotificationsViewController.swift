//
//  NotificationsViewController.swift
//  Alamo-fire
//
//  Created by Abhilash k George on 23/05/22.
//

import UIKit

class NotificationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    //    self.view.backgroundColor = .yellow
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        title.text = "Notifications"
        title.textAlignment = .center
        title.center = view.center
        title.font = .boldSystemFont(ofSize: 24)
        view.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),])

    }

}
