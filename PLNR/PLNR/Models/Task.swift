//
//  Task.swift
//  PLNR
//
//  Created by Dylan Hawryluk on 11/20/23.
//

import Foundation
import UIKit

import ParseSwift

struct Task: ParseObject {
    // These are required by ParseObject
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    // custom properties
    var title: String?
    var description: String?
    var dueDate: Date?
    var createdBy: String?
}


