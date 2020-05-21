//
//  RegisterViewController.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 21/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
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
    
    // MARK: UI Methods
    
    private func configureView() {
        // Make login button round and nice
        registerBtn.makeOvalBtn(AppUtility().primaryColor, withAlpha: 0.5)
        
        // Add toggle-eye in password to show/hide
        let passwordToggle = passwordTextField.addToggle(UIImage(named: "hide_pass")!)
        passwordToggle.addTarget(self, action: #selector(togglePassword), for: .touchUpInside)
    }
    
    private func setupTextFields() {
        [firstNameTextField, lastnameTextField, usernameTextField, passwordTextField].forEach({
            $0.addTarget(self, action: #selector(checkRegisterBtn), for: .editingChanged)
        })
    }
    
    // MARK: UI Actions
    
    @IBAction func backPressedBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerPressedBtn(_ sender: Any) {
        guard let passText = usernameTextField.text else {
            return
        }
        if !passText.isEmailValid() {
            showNoActionAlert(NSLocalizedString("register_failed", tableName: "Resources_EN", comment: ""),
                              message: NSLocalizedString("invalid_email", tableName: "Resources_EN", comment: ""))
        }
    }
    
    // MARK: Obj-C Methods
    @objc func checkRegisterBtn() {
        if TextUtils.shared.trim(firstNameTextField.text).isEmpty || TextUtils.shared.trim(lastnameTextField.text).isEmpty || TextUtils.shared.trim(usernameTextField.text).isEmpty || TextUtils.shared.trim(passwordTextField.text).isEmpty {
            registerBtn.isEnabled = false
            registerBtn.backgroundColor = AppUtility().primaryColor.withAlphaComponent(0.5)
        } else {
            registerBtn.isEnabled = true
            registerBtn.backgroundColor = AppUtility().primaryColor
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