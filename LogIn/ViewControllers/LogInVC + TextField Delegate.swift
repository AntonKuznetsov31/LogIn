//
//  LogInVC + TextField Delegate.swift
//  LogIn
//
//  Created by Anton Kuznetsov on 21.01.2020.
//  Copyright © 2020 AntonKuznetsov. All rights reserved.
//

import UIKit

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
