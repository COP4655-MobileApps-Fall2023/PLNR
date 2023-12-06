//
//  Task.swift
//  PLNR
//
//  Created by Dylan Hawryluk on 11/20/23.
//

import Foundation
import UIKit

struct Task {
    var title: String
    var description: String
    var dueDate: Date
    
    static let sampleTasks: [Task] = [
        Task(title: "Task 1", description: "Do something", dueDate: Date()),
        Task(title: "Task 2", description: "Do something else", dueDate: Calendar.current.date(byAdding: .day, value: 3, to: Date())!),
    ]
}


