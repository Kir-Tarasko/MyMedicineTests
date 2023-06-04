//
//  ViewController.swift
//  GPT
//
//  Created by Kirill Tarasko on 07.05.2023.
//

import UIKit

class LoginView: UIView {
    
    // Создание полей ввода логина и пароля
    let loginTextField: UITextField = {
        let textField = UITextField()
        let placeholderText = NSAttributedString(string: "Логин", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textField.attributedPlaceholder = placeholderText
        textField.textColor = .black
        textField.layer.cornerRadius = 15.0
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.autocapitalizationType = .none
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.clearsOnBeginEditing = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.textColor = .black
        textField.layer.cornerRadius = 15.0
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.isSecureTextEntry = true
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.clearsOnBeginEditing = false
        return textField
    }()
    
    // Создание кнопки регистрации
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Регистрация", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Вход", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // Инициализация View и добавление на нее элементов
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let subwiews = [loginTextField, passwordTextField, registerButton, loginButton]
        
        for subwiew in subwiews {
            addSubview(subwiew)
            subwiew.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            // Размещение поля ввода логина
            loginTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            loginTextField.widthAnchor.constraint(equalToConstant: 200),
            loginTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Размещение поля ввода пароля
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            loginButton.widthAnchor.constraint(equalToConstant: 150),
            loginButton.heightAnchor.constraint(equalToConstant: 40),

            // Размещение кнопки регистрации
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            registerButton.widthAnchor.constraint(equalToConstant: 150),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    // Проверка логина и пароля при нажатии на кнопку регистрации
    @objc func registerButtonTapped() {
        guard let login = loginTextField.text, let password = passwordTextField.text else {
            return
        }
        
        if login == "Kir" && password == "123456" {
            print("Вход выполнен")
        } else {
            print("Неверный логин или пароль")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.placeholder = nil
        passwordTextField.placeholder = nil
    }
}





