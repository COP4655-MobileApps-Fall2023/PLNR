//
//  WeekViewController.swift
//  PLNR
//
//  Created by Will Reed on 11/19/23.
//TaskViewControllerDelegate

import UIKit
import Foundation

class WeekViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let daysOfTheWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var tasks : [Task] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysOfTheWeek.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayTableViewCell", for: indexPath) as! DayTableViewCell
        
        cell.dayLabel.text = daysOfTheWeek[indexPath.row]
        
        return cell
    }
    
    
//    var selectedDay: String?
//    var tasksByDay: [String: [Task]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(self) - viewDidLoad")
        
        tableView.dataSource = self
        
        tasks = Task.sampleTasks
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // TODO: Deselect any selected table view rows

        // Get the index path for the current selected table view row (if exists)
        if let indexPath = tableView.indexPathForSelectedRow {

            // Deslect the row at the corresponding index path
            tableView.deselectRow(at: indexPath, animated: true)
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
        if let cell = sender as? UITableViewCell,
            // Get the index path of the cell from the table view
            let indexPath = tableView.indexPath(for: cell),
            let dayViewController = segue.destination as? DayViewController {
            
            let calendar = Calendar.current
            let startOfWeek = calendar.date(from: calendar.dateComponents([.year, .month, .day], from: Date()))!
            
            let df = DateFormatter()
            df.dateFormat = "EEEE"
            let dayIndex = daysOfTheWeek.firstIndex(of: df.string(from: Date()))!
            
            let startOfDay = calendar.date(byAdding: .day, value: indexPath.row - dayIndex, to: startOfWeek)!
            let endOfDay = calendar.date(byAdding: .day, value: indexPath.row+1 - dayIndex, to: startOfWeek)!
            
            var dayTasks: [Task] = []
            
            
            for task in tasks {
                if startOfDay <= task.dueDate && task.dueDate < endOfDay {
                    dayTasks.append(task)
                }
            }
            dayViewController.configure(dayDate: startOfDay, tasks: dayTasks)
        }
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
