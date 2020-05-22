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
        loginBtn.makeOvalBtn(AppUtility().primaryColor, withAlpha: 0.5)
        
        // Add toggle-eye in password to show/hide
        let passwordToggle = passwordTextField.addToggle(UIImage(named: "hide_pass")!)
        passwordToggle.addTarget(self, action: #selector(togglePassword), for: .touchUpInside)
    }
    
    private func setupTextFields() {
        [usernameTextField, passwordTextField].forEach({
            $0.addTarget(self, action: #selector(checkLoginBtn), for: .editingChanged)
        })
        addDoneToolbar(forTextField: usernameTextField)
        addDoneToolbar(forTextField: passwordTextField)
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
    
    @IBAction func registerAction(_ sender: Any) {
        performSegue(withIdentifier: "registerUser", sender: self)
    }
    
    
    // MARK: Obj-C Functions
    
    @objc func checkLoginBtn() {
        
        if TextUtils.shared.trim(usernameTextField.text).isEmpty || TextUtils.shared.trim(passwordTextField.text).isEmpty {
            loginBtn.isEnabled = false
            loginBtn.backgroundColor = AppUtility().primaryColor.withAlphaComponent(0.5)
        } else {
            loginBtn.isEnabled = true
            loginBtn.backgroundColor = AppUtility().primaryColor
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
