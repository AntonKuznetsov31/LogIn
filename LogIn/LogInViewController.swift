//
//  LogInViewController.swift
//  LogIn
//
//  Created by Anton Kuznetsov on 8/6/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Private Properties
    private var user = User()
    private var enteredUsername = String()
    private var enteredPassword = String()
    
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

// MARK: - Text field delegate
extension LogInViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let enteredText = textField.text else { return }
        
        switch textField.tag {
        case 0:
            enteredUsername = enteredText
        case 1:
            enteredPassword = enteredText
        default:
            return
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            logInPressed()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

