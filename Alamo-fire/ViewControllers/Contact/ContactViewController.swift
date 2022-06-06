//
//  ContactViewController.swift
//  Alamo-fire
//
//  Created by Abhilash k George on 02/06/22.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController, MFMailComposeViewControllerDelegate {

    
    var viewModel = ContactViewModel()
    
    @IBOutlet weak var phoneNumberBtn: UIButton!
    @IBOutlet weak var mailIdBtn: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var activityLoaderView: UIView!
  
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    var phoneNumber: String?
    var mailID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        
//        // remove left buttons (in case you added some)
//         self.navigationItem.leftBarButtonItems = []
//        // hide the default back buttons
        activityLoaderView.isHidden = false
        activitySpinner.startAnimating()
        getContactDetails()
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
       navigationController?.navigationBar.tintColor = .black
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: UIImage.AssetImages.backButton.rawValue), style: .plain, target: self, action: #selector(backBtnTapped))
        ]
    }
    @objc func backBtnTapped() {
        navigationController?.navigationBar.isHidden = true
        self.navigationController?.popViewController(animated: true)
    }
    
    func getContactDetails() {
        viewModel.contactData { contactData in
            DispatchQueue.main.async {
                self.activitySpinner.stopAnimating()
                self.activityLoaderView.isHidden = true
                print(contactData)
                let address = ("\(contactData.buildingName?.capitalizingFirstLetter() ?? ""), \(contactData.area?.capitalizingFirstLetter() ?? ""), \n \(contactData.city?.capitalizingFirstLetter() ?? "" ) - \(contactData.pincode ?? 0) ")
                
                self.addressLabel.text = address
                self.phoneNumberBtn.setTitle(contactData.contactNumber, for: .normal)
                self.mailIdBtn.setTitle(contactData.emailId, for: .normal)
            }
        }
    }
    
    @IBAction func phoneNumberBtnTapped(_ sender: Any) {
        guard let phoneNumber = phoneNumber else {
            return
        }

        callNumber(phoneNumber: phoneNumber )
    }
    
    @IBAction func mailIdBtnTapped(_ sender: Any) {
    }
    func sendEmail() {
        guard let mailID = mailID else {
            return
        }

        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([mailID])
            mail.setMessageBody("<p>Alamofire app!</p>", isHTML: true)

            present(mail, animated: true)
        } else {
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    private func callNumber(phoneNumber:String) {
      if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
            application.open(phoneCallURL, options: [:], completionHandler: nil)
        }
      }
    }

}
