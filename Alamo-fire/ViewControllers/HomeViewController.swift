//
//  HomeViewController.swift
//  Alamo-fire
//
//  Created by Abhilash k George on 23/05/22.
//

import UIKit


let apiManager = ApiManager()

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.getRequestWithAlamoFire()
        
    }
}



