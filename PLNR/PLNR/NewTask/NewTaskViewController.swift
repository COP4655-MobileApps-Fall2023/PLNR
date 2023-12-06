//
//  NewTaskViewController.swift
//  PLNR
//
//  Created by Ethan Curtis on 12/6/23.
//

import UIKit

class NewTaskViewController: UIViewController {
    var taskTitle: String = ""
    var taskDescription: String = ""
    var taskDate: Date = Date()
    
    @IBAction func onTaskTitleEdit(_ sender: UITextField) {
        taskTitle = sender.text ?? ""
        print(taskTitle)
        
        completeButton.isEnabled = taskTitle != "" && taskDescription != ""
    }
    
    @IBAction func onTaskDescriptionEdit(_ sender: UITextField) {
        taskDescription = sender.text ?? ""
        print(taskDescription)
        
        completeButton.isEnabled = taskTitle != "" && taskDescription != ""
    }
    
    @IBAction func onTaskDateEdit(_ sender: UIDatePicker) {
        taskDate = sender.date
    }
    
    @IBOutlet weak var completeButton: UIButton!
    
    @IBAction func onCreate(_ sender: Any) {
        var task = Task()
        
        task.title = taskTitle
        task.description = taskDescription
        task.dueDate = taskDate
        task.createdBy = User.current!.username!
        
        task.save { [weak self] result in
            // Switch to the main thread for any UI updates
            DispatchQueue.main.async {
                switch result {
                case .success(let task):
                    print("Succeeded in saving task!")
                    print(task)
                case .failure(let error):
                    print("Failed to save task!")
                    print(error.description)
                }
                
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
