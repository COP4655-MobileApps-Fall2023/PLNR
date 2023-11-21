//
//  DayViewController.swift
//  PLNR
//
//  Created by Will Reed on 11/7/23.
//

import UIKit



class DayViewController: UIViewController {
    var selectedDay: String?
    @IBOutlet weak var titleLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(self) - viewDidLoad")
        if let day = selectedDay {
            titleLabel.text = "\(day)'s Schedule"
        }

        // Do any additional setup after loading the view.
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
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


