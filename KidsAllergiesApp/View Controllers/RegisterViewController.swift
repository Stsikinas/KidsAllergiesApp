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
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    // MARK: Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
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
        registerBtn.makeOvalBtn(AppUtility().primaryColor, withAlpha: 0.5)
    }
    
    // MARK: UI Actions
    
    @IBAction func backPressedBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
