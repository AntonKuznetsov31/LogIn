//
//  UserDataViewController.swift
//  LogIn
//
//  Created by Anton Kuznetsov on 8/6/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

class UserDataViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var user = User()
    
    var enteredUsername = String()
    var enteredPassword = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        userNameTextField.tag = 0
        passwordTextField.delegate = self
        passwordTextField.tag = 1
        
    }
    
    @IBAction func forgotUsernamePressed() {
        let ac = UIAlertController(title: "Username", message: "Your username is \(user.username)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        ac.addAction(ok)
        present(ac, animated: true)
    }
    
    @IBAction func forgotPasswordPressed() {
        let ac = UIAlertController(title: "Password", message: "Your password is \(user.password)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        ac.addAction(ok)
        present(ac, animated: true)
    }
    
    func isUserInDatabase() -> Bool {
        if enteredUsername == user.username && enteredPassword == user.password {
            return true
        } else {
            return false
        }
    }
}

extension UserDataViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let enteredText = textField.text else { return }
        
        switch textField.tag {
        case 0:
            self.enteredUsername = enteredText
        case 1:
            self.enteredPassword = enteredText
        default:
            return
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if isUserInDatabase() {
            performSegue(withIdentifier: "welcomeSegue", sender: self)
        } else {
            let ac = UIAlertController(title: "Error", message: "Incorrect username or password", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Try again", style: .default)
            ac.addAction(ok)
            present(ac, animated: true)
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

