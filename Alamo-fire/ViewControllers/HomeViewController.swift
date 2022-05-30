//  HomeViewController.swift
//  Alamo-fire
//  Created by Abhilash k George on 23/05/22.

import UIKit


let apiManager = ApiManager()

class HomeViewController: UIViewController {
    
   
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apiManager.getRequestWithAlamoFire()
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
}
 
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstTableCell") as! HomeScreenTableViewCell
            cell.configureCells(indexPath: indexPath.row)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondTableCell") as! HomeScreenTableViewCell
            cell.configureCells(indexPath: indexPath.row)
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdTableCell") as! HomeScreenTableViewCell
            cell.configureCells(indexPath: indexPath.row)
            return cell

        } else if indexPath.row == 3{

            let cell = tableView.dequeueReusableCell(withIdentifier: "fourthTableCell") as! HomeScreenTableViewCell
            cell.configureCells(indexPath: indexPath.row)
            return cell
        }
        else if indexPath.row >= 4{

            let cell = tableView.dequeueReusableCell(withIdentifier: "fifthTableCell") as! HomeScreenTableViewCell
            cell.configureCells(indexPath: indexPath.row)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        } else if indexPath.row == 1 {
            return 200
        }
        
        else if indexPath.row == 2 {
            return 400
        } else {
            return 230
        }
    }
}


