//
//  DayViewController.swift
//  PLNR
//
//  Created by Will Reed on 11/7/23.
//

import UIKit

protocol DayViewControllerDelegate: AnyObject {
    func didSelectDay(_ selectedDay: String?)
}

class DayViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        
        let task = tasks[indexPath.row]
        
        cell.taskNameLabel.text = task.title
        cell.taskTimeLabel.text = getTime(from: task.dueDate)
        cell.taskDescription.text = task.description
        
        return cell
    }
    
    var tasks: [Task] = []
    var dayDate: Date = Date()
    
    weak var delegate: DayViewControllerDelegate?
    var selectedDay: String?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    func didSelectedDay(_ selectedDay: String?) {
        delegate?.didSelectDay(selectedDay)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        titleLabel.text = formatDate(dayDate)
    }
    
    /*@IBAction func onLogoutTapped(_ sender: Any) {
        showConfirmLogoutAlert()
    }*/
    
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
    
    func configure(dayDate: Date, tasks: [Task]) {
        print("Received " + String(tasks.count) + " tasks.")
        
        self.tasks = tasks
        self.dayDate = dayDate
    }
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d, yyyy"
        
        let dateString = dateFormatter.string(from: date)
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "d"
        
        if let day = Int(dayFormatter.string(from: date)) {
            switch day {
            case 1, 21, 31:
                return dateString.replacingOccurrences(of: "\(day)", with: "\(day)st")
            case 2, 22:
                return dateString.replacingOccurrences(of: "\(day)", with: "\(day)nd")
            case 3, 23:
                return dateString.replacingOccurrences(of: "\(day)", with: "\(day)rd")
            default:
                return dateString.replacingOccurrences(of: "\(day)", with: "\(day)th")
            }
        }
        
        return dateString
    }
    
    private func getTime(from date: Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a" // This format displays hours, minutes, and AM/PM
        
        let timeString = timeFormatter.string(from: date)
        return timeString
    }
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


