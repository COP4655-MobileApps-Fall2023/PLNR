//
//  TaskManager.swift
//  PLNR
//
//  Created by Dylan Hawryluk on 11/20/23.
//

import Foundation

class TaskManager{
    var tasks: [Task] = []
    
    func addTask(name: String, description: String, dayOfWeek: String){
        let task = Task(name: name, description: description, dayOfWeek: dayOfWeek)
        tasks.append(task)
        
    }
    
    func tasksForDay(dayOfWeek: String) -> [Task]{
        return tasks.filter{ $0.dayOfWeek == dayOfWeek}
        
    }
}
