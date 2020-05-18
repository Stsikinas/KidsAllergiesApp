//
//  LoginViewController.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 8/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var newUserBtn: UIButton!
    // MARK: Private Variables
    private var loginColor = UIColor(red: 0, green: 0.675, blue: 0.290, alpha: 1.0)
    
    // MARK: Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        setupTextFields()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AppUtility.lockOrientation(.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        AppUtility.lockOrientation(.all)
    }
    
    // MARK: UI Functions
    
    private func configureView() {
        
        // Make login button round and nice
        loginBtn.layer.cornerRadius = loginBtn.frame.height/2
        loginBtn.clipsToBounds = true
        loginBtn.isEnabled = false
        loginBtn.backgroundColor = loginColor.withAlphaComponent(0.5)
        
        // Add toggle-eye in password to show/hide
        passwordTextField.rightViewMode = .unlessEditing
        let toggleButton = UIButton(frame: CGRect(x: passwordTextField.frame.size.width - 25, y: 5, width: 15, height: 25))
        toggleButton.setImage(UIImage(named: "hide_pass"), for: .normal)
        toggleButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: -24, bottom: 5, right: 15)
        toggleButton.addTarget(self, action: #selector(togglePassword), for: .touchUpInside)
        toggleButton.accessibilityIdentifier = "toggleButton"
        passwordTextField.rightView = toggleButton
        passwordTextField.rightViewMode = .always
        passwordTextField.isSecureTextEntry = true
        
    }
    
    private func setupTextFields() {
        [usernameTextField, passwordTextField].forEach({
            $0.addTarget(self, action: #selector(checkLoginBtn), for: .editingChanged)
        })
    }
    
    // MARK: UI Actions
    
    @IBAction func loginAction(_ sender: Any) {
        if (usernameTextField.text == "test" && passwordTextField.text == "12345") {
            debugPrint("Login succeeded!")
            let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
            guard let initialHome = homeStoryboard.instantiateInitialViewController() else {
                return
            }
            AccountHelper.shared.setNewUser()
            present(initialHome, animated: true, completion: nil)
        } else {
            showNoActionAlert(NSLocalizedString("login_failed", tableName: "Resources_EN", comment: ""),
                              message: NSLocalizedString("login_failed_msg", tableName: "Resources_EN", comment: ""))
        }
    }
    
    
    // MARK: Obj-C Functions
    
    @objc func checkLoginBtn() {
        
        if TextUtils.shared.trim(usernameTextField.text).isEmpty || TextUtils.shared.trim(passwordTextField.text).isEmpty {
            loginBtn.isEnabled = false
            loginBtn.backgroundColor = loginColor.withAlphaComponent(0.5)
        } else {
            loginBtn.isEnabled = true
            loginBtn.backgroundColor = loginColor
        }
        
    }
    
    @objc func togglePassword(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            passwordTextField.isSecureTextEntry = false
            sender.setImage(UIImage(named: "show_pass"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            sender.setImage(UIImage(named: "hide_pass"), for: .normal)
        }
    }
    
}
