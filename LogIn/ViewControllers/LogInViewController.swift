//
//  LogInViewController.swift
//  LogIn
//
//  Created by Anton Kuznetsov on 1/21/20.
//  Copyright © 2020 AntonKuznetsov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Private Properties
    private var user = User()
    var enteredUsername = String()
    var enteredPassword = String()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        userNameTextField.tag = 0
        passwordTextField.delegate = self
        passwordTextField.tag = 1
    }
    
    // MARK: - IBActions
    @IBAction func forgotUsernamePressed() {
        showAlert(title: "Username",
                  message: "Your name is \(user.username)")
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlert(title: "Password",
                  message: "Your password is \(user.password)")
    }
    
    @IBAction func logInPressed() {
        guard
            userNameTextField.text == user.username,
            passwordTextField.text == user.password
            else {
                showAlert(title: "Invalid login or password",
                          message: "Please, enter correct login and password",
                          textField: passwordTextField)
                return
        }
        
        performSegue(withIdentifier: "logInSegue", sender: nil)
    }
    
    // MARK: - Private Properties
    private func isUserInDatabase() -> Bool {
        return enteredUsername == user.username && enteredPassword == user.password
    }
}

// MARK: - Alert Controller
extension LogInViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
