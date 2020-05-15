//
//  WelcomeViewController.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 4/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var getStartedBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var welcomeImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: Private Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.transition(
            with: welcomeImageView,
            duration: 3.0,
            options: .transitionCrossDissolve,
            animations: {
                self.welcomeImageView.image = UIImage(named: "community.png")
            },
            completion: { _ in
                self.titleLabel.text = NSLocalizedString("title_2", tableName: "Resources_EN", comment: "")
                self.descriptionLabel.text = NSLocalizedString("desc_2", tableName: "Resources_EN", comment: "")
                UIView.transition(
                    with: self.welcomeImageView,
                    duration: 3.0,
                    options: .transitionCrossDissolve,
                    animations: { self.welcomeImageView.image = UIImage(named: "recipes.png")},
                    completion: { _ in
                        self.titleLabel.text = NSLocalizedString("title_3", tableName: "Resources_EN", comment: "")
                        self.descriptionLabel.text = NSLocalizedString("desc_3", tableName: "Resources_EN", comment: "")
                })
        })

    }
    
    private func configureView() {
        
        getStartedBtn.layer.cornerRadius = getStartedBtn.frame.height/2
        getStartedBtn.clipsToBounds = true
        
        titleLabel.text = NSLocalizedString("title_1", tableName: "Resources_EN", comment: "")
        descriptionLabel.text = NSLocalizedString("desc_1", tableName: "Resources_EN", comment: "")
        
    }

}
