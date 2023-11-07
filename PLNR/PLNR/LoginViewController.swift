//
//  LoginViewController.swift
//  PLNR
//
//  Created by Dylan Hawryluk on 11/6/23.
//



import UIKit



class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    //@IBOutlet weak var usernameField: UITextField!
    //@IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onLoginTapped(_ sender: UIButton) {
        
        guard let username = usernameField.text,
              let password = passwordField.text,
              !username.isEmpty,
              !password.isEmpty else {

            showMissingFieldsAlert()
            return
        }

        
        User.login(username: username, password: password) { [weak self] result in

            switch result {
            case .success(let user):
                print("✅ Successfully logged in as user: \(user)")
                self?.performSegue(withIdentifier: "goToNext", sender: self)

                
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)

            case .failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
        }

    
    }
    //@IBAction func onLoginTapped(_ sender: Any) {

        
      //  guard let username = usernameField.text,
        //      let password = passwordField.text,
          //    !username.isEmpty,
            //  !password.isEmpty else {

            //showMissingFieldsAlert()
            //return
        //}

        
        //User.login(username: username, password: password) { [weak self] result in

          //  switch result {
            //case .success(let user):
              //  print("✅ Successfully logged in as user: \(user)")

                
                //NotificationCenter.default.post(name: Notification.Name("login"), object: nil)

            //case .failure(let error):
              //  self?.showAlert(description: error.localizedDescription)
            //}
        //}

    //}

    private func showAlert(description: String?) {
        let alertController = UIAlertController(title: "Unable to Log in", message: description ?? "Unknown error", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    private func showMissingFieldsAlert() {
        let alertController = UIAlertController(title: "Opps...", message: "We need all fields filled out in order to log you in.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}


