//
//  MainViewController.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 4/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if AccountHelper.shared.isNewUser() {
            // Add onboarding view
            let vc = storyboard?.instantiateViewController(withIdentifier: "welcome") as! WelcomeViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
        
    }

}
