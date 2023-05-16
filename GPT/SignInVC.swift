//
//  SignInVC.swift
//  GPT
//
//  Created by Kirill Tarasko on 07.05.2023.
//

import UIKit

class SignInVC: UIViewController, UITextFieldDelegate {
   
    lazy var loginView = LoginView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        view.addSubview(loginView)
        setLoginButton(enabled: false)
        textFieldSetup()
    }
}

extension SignInVC {
    
    private func textFieldSetup() {
        
        let textFields = [loginView.loginTextField, loginView.passwordTextField ]
        
        for textField in textFields {
            textField.delegate = self
            textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        }
        
        textFields.first?.tag = 0
        textFields.first?.returnKeyType = .next
        
        textFields.last?.tag = 1
        textFields.last?.returnKeyType = .done
        
        registerKeyboardNotification()
        hideKeyboardWhenTappedAround()
    }
    
    @objc private func textFieldChanged() {
        
        guard
            let login = loginView.loginTextField.text,
            let password = loginView.passwordTextField.text
        else { return }
        
        let formFilled = !(login.isEmpty) && !(password.isEmpty)
        
        setLoginButton(enabled: formFilled)
    }
    
    private func setLoginButton(enabled:Bool) {

        if enabled {
            loginView.loginButton.alpha = 1.0
            loginView.loginButton.isEnabled = true
        } else {
            loginView.loginButton.alpha = 0.9
            loginView.loginButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField, loginView.loginTextField.text != "" {
            nextField.becomeFirstResponder()
        } else if textField == self.loginView.passwordTextField {
            textField.resignFirstResponder()
            
        }
        return true
    }
    
    func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignInVC.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        self.view.frame.origin.y = -250
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        self.view.frame.origin.y = 0
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


