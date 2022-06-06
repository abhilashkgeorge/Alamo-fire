//
//  ContactModel .swift
//  Alamo-fire
//
//  Created by Abhilash k George on 03/06/22.
//

import Foundation


class ContactModel {
    let contactNumber : String?
    let emailId : String?
    let buildingName : String?
    let area : String?
    let city : String?
    let pincode : Int?
    
    init(contactNumber: String, emailId: String, buildingName: String, area: String, city: String, pincode: Int) {
        self.contactNumber = contactNumber
        self.emailId = emailId
        self.buildingName = buildingName
        self.area = area
        self.city = city
        self.pincode = pincode
    }
}
