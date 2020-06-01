//
//  UIKitExtensions.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 14/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation
import UIKit

// MARK: UIKit Extensions

extension UIView {
    
    func addAnchors(wAnchor: NSLayoutDimension? = nil, _ wMulti: CGFloat? = nil,
                    hAnchor: NSLayoutDimension? = nil,_ hMulti: CGFloat? = nil,
                    cXAnchor: NSLayoutXAxisAnchor? = nil, cYAnchor: NSLayoutYAxisAnchor? = nil,
                    lAnchor: NSLayoutXAxisAnchor? = nil, leftConstant: CGFloat? = nil,
                    tAnchor: NSLayoutYAxisAnchor? = nil, topConstant: CGFloat? = nil,
                    rAnchor: NSLayoutXAxisAnchor? = nil, rightConstant: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if wAnchor != nil {
            if wMulti == nil {
                widthAnchor.constraint(equalTo: wAnchor!, multiplier: 1.0).isActive = true
            } else {
                widthAnchor.constraint(equalTo: wAnchor!, multiplier: wMulti!).isActive = true
            }
        }
        if hAnchor != nil {
            if hMulti == nil {
                heightAnchor.constraint(equalTo: hAnchor!, multiplier: 1.0).isActive = true
            } else {
                heightAnchor.constraint(equalTo: hAnchor!, multiplier: hMulti!).isActive = true
            }
        }
        if cXAnchor != nil {
            centerXAnchor.constraint(equalTo: cXAnchor!, constant: 0).isActive = true
        }
        if cYAnchor != nil {
            centerYAnchor.constraint(equalTo: cYAnchor!, constant: 0).isActive = true
        }
        if lAnchor != nil {
            if leftConstant == nil {
                leftAnchor.constraint(equalTo: lAnchor!, constant: 0).isActive = true
            } else {
                leftAnchor.constraint(equalTo: lAnchor!, constant: leftConstant!).isActive = true
            }
        }
        if tAnchor != nil {
            if tAnchor == nil {
                topAnchor.constraint(equalTo: tAnchor!, constant: 0).isActive = true
            } else {
                topAnchor.constraint(equalTo: tAnchor!, constant: topConstant!).isActive = true
            }
        }
        if rAnchor != nil {
            if rightConstant == nil {
                rightAnchor.constraint(equalTo: rAnchor!, constant: 0).isActive = true
            } else {
                rightAnchor.constraint(equalTo: rAnchor!, constant: rightConstant!).isActive = true
            }
        }
    }
    
    func cardView(ofRadius: CGFloat, withShadow: UIColor) {
        layer.cornerRadius = ofRadius
        layer.shadowColor = withShadow.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = 12.0
        layer.shadowOpacity = 0.7
    }
    
}

extension UITableViewController {
    
    func setupTableViewProperties() {
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }
    
}

extension UIViewController: UITextFieldDelegate {
    
    // Add notification center to handle notifications
    public final var notificationCenter: NotificationCenter {
        get {
            return NotificationCenter.default
        }
    }
    
    func setupNavigation(withTitle: String? = nil, withImage: UIImage? = nil) {
        
        if withImage != nil {
            guard let navController = navigationController else {
                return
            }
            
            let imageView = UIImageView(image: withImage)

            let bannerWidth = navController.navigationBar.frame.size.width
            let bannerHeight = navController.navigationBar.frame.size.height

            let bannerX = bannerWidth / 2 - (withImage!.size.width) / 2
            let bannerY = bannerHeight / 2 - (withImage!.size.height) / 2

            imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
            imageView.contentMode = .scaleAspectFit

            navigationItem.titleView = imageView
        } else if withTitle != nil {
             title = withTitle
            navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 25.0)!
            ]
        }
       
        navigationController?.navigationBar.barTintColor = AppUtility().primaryColor
        navigationController?.navigationBar.isTranslucent = false
        
    }
    
    func showNoActionAlert(_ withTitle: String, message: String) {
        let alert = UIAlertController(title: withTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: false, completion: nil)
    }
    
    func addDoneToolbar(forTextField: UITextField) {
        let toolbar = UIToolbar()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneClicked))
        doneButton.accessibilityIdentifier = "doneToolbar"
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelClicked))
        cancelButton.accessibilityIdentifier = "cancelToolbar"
        toolbar.setItems([cancelButton, flexibleSpace, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        toolbar.sizeToFit()
        
        forTextField.delegate = self
        forTextField.inputAccessoryView = toolbar
        
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    @objc func cancelClicked() {
        view.endEditing(true)
    }
    
}


public extension UIButton {
    
    func makeOvalBtn(_ withColor: UIColor, withAlpha: CGFloat) {
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
        if withAlpha < 1 {
            isEnabled = false
        } else {
            isEnabled = true
        }
        backgroundColor = withColor.withAlphaComponent(withAlpha)
    }
    
}

public extension UITextField {
    
    func addToggle(_ image: UIImage) -> UIButton {
        rightViewMode = .unlessEditing
        let toggleButton = UIButton(frame: CGRect(x: frame.size.width - 25, y: 5, width: 15, height: 25))
        toggleButton.setImage(image, for: .normal)
        toggleButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: -24, bottom: 5, right: 15)
        toggleButton.accessibilityIdentifier = "toggleButton"
        rightView = toggleButton
        rightViewMode = .always
        isSecureTextEntry = true
        
        return toggleButton
    }
    
}

// MARK: Rest Extensions

public extension String {
    
    func isEmailValid() -> Bool {
        
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
