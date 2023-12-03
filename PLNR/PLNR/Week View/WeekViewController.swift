//
//  WeekViewController.swift
//  PLNR
//
//  Created by Will Reed on 11/19/23.
//TaskViewControllerDelegate

import UIKit
import Foundation

class WeekViewController: UIViewController {
    
//    var selectedDay: String?
//    var tasksByDay: [String: [Task]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(self) - viewDidLoad")
      
    }
    
    @IBAction func dayButtonClicked(_ sender: UIButton){
        
        if let selectedDay = sender.titleLabel?.text{
            performSegue(withIdentifier: "\(selectedDay)Segue", sender: selectedDay)
        }
        
      
        
    }
    

    
    @IBAction func ribbonButtonTapped(_ sender: UIButton) {

        performSegue(withIdentifier: "NewTaskSegue", sender: nil)

    }
//
//
//    func didSelectDay(_ selectedDay: String?) {
//
//    }
//
//    func didCreateTask(_ task: Task) {
//        tasksByDay[selectedDay!, default: []].append(task)
//        //tableView.reloadData()
//        guard selectedDay != nil else {
//            print("Error: selectedDay is nil")
//            return
//        }
//
//    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MondaySegue" || segue.identifier == "TuesdaySegue" || segue.identifier == "WednesdaySegue" || segue.identifier == "ThursdaySegue" || segue.identifier == "FridaySegue" || segue.identifier == "SaturdaySegue" || segue.identifier == "SundaySegue",
           let destinationVC = segue.destination as? DayViewController,
           let selectedDay = sender as? String {
            destinationVC.selectedDay = selectedDay
        
        }
        print("Preparing for ssegue: \(segue.identifier ?? "No Identifier")")
    }
    
    @IBAction func onLogoutTapped(_ sender: Any) {
        showConfirmLogoutAlert()
    }
    
    private func showConfirmLogoutAlert() {
        let alertController = UIAlertController(title: "Log out of \(User.current?.username ?? "current account")?", message: nil, preferredStyle: .alert)
        let logOutAction = UIAlertAction(title: "Log out", style: .destructive) { _ in
            NotificationCenter.default.post(name: Notification.Name("logout"), object: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(logOutAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
