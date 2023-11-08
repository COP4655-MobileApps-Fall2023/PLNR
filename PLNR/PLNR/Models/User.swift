//
//  User.swift
//  PLNR
//
//  Created by Dylan Hawryluk on 11/6/23.
//

import Foundation
import ParseSwift

struct User: ParseUser {
  
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    
    var username: String?
    var email: String?
    var emailVerified: Bool?
    var password: String?
    var authData: [String: [String: String]?]?

    
}
