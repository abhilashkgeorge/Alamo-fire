//
//  ContactViewModel.swift
//  Alamo-fire
//
//  Created by Abhilash k George on 03/06/22.
//

import Foundation

class ContactViewModel {
    let apiManager = ApiManager()
    let networkManager = ContactNetworkManager()

    func contactSerialization(json: Any) -> ContactModel {
        
        
        let newJson = json as? [String: AnyObject]
        let contactNumber = newJson!["contactNumber"] as? String ?? "no contactNumber"
        let emailId = newJson!["emailId"] as? String ?? "no email"
        let buildingName = newJson!["buildingName"] as? String ?? "no buildingName"
        let area = newJson!["area"] as? String ?? "no area details"
        let city = newJson!["city"] as? String ?? "no city details"
        let pincode = newJson!["pincode"] as? Int ?? 0000
     
        let contactData = ContactModel(contactNumber: contactNumber, emailId: emailId, buildingName: buildingName, area: area, city: city, pincode: pincode)
        
        return contactData
    }
    
    func contactData(completionHandler: @escaping (_ contactData: ContactModel) -> Void) {
        networkManager.getcontactDetais(completionHandler: { json in
            let details = self.contactSerialization(json: json)
             completionHandler(details)
        })
    }
}
