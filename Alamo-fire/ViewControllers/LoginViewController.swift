//
//  LoginViewController.swift
//  Alamo-fire
//
//  Created by Abhilash k George on 26/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var profileLogo: UIImageView!
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeMessageLabel.text = "Welcome Back Ashwin!"
        profileLogo.image = UIImage(named: UIImage.AssetImages.profile.rawValue)?.circleMasked

    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController")
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
    }
    
    @IBAction func continueWithOtpButtonTapped(_ sender: Any) {
    }
    
    @IBAction func connectAnotherEmailIDTapped(_ sender: Any) {
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
    }
}
