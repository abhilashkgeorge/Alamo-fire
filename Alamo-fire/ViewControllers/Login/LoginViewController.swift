//
//  LoginViewController.swift
//  Alamo-fire
//
//  Created by Abhilash k George on 26/05/22.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var profileLogo: UIImageView!
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var loginButton: LoginButton!
    
    
    let password = "admin"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.backgroundColor = .tabBarNavy
        loginButton.layer.opacity = 0.5
        loginButton.layer.cornerRadius = 10
        passwordLabel.delegate = self
        welcomeMessageLabel.text = "Welcome Back Ashwin!"
        profileLogo.image = UIImage(named: UIImage.AssetImages.profile.rawValue)?.circleMasked

    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let text = (passwordLabel.text! as NSString).replacingCharacters(in: range, with: string)
    if text.isEmpty {
        loginButton.backgroundColor = .tabBarNavy
        loginButton.layer.opacity = 0.5
        
    } else {
        loginButton.backgroundColor = .buttonHighlightedColor
        loginButton.layer.opacity = 1
    }
     return true
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        var messageText = ""
        
        if passwordLabel.text == password {
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            let viewController = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController")
            
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            if passwordLabel.text == "" {
                messageText = "Enter the Password"
                
            } else {
                messageText = "Invalid Password"
            }
            let alert = UIAlertController(title: messageText, message: "" , preferredStyle: .alert)
           
            let optionYes = UIAlertAction(title: "OKAY", style: .default) { (selection) in
                self.passwordLabel.text = ""
                alert.dismiss(animated: true, completion: nil)
                }
            present(alert, animated: true, completion: nil)
            alert.addAction(optionYes)
        }
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
