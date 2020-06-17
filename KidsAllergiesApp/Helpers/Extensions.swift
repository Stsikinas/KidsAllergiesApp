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

extension UIImageView {
    
    func crossDisolve(to imageView: UIImageView) {
        UIView.transition(from: self,
                          to: imageView,
                          duration: 0.95,
                          options: .transitionCrossDissolve,
                          completion: nil)
    }
    
    func maskCircle(_ forImage: UIImage) {
        contentMode = .scaleAspectFill
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = false
        clipsToBounds = true
        
        image = forImage
    }
}

extension UIColor {
    
    class var lightBeige: UIColor {
        get {
            return UIColor(red: 0.984, green: 0.984, blue: 0.941, alpha: 1.0)
        }
    }
    class var peach: UIColor {
        get {
            return UIColor(red: 1.0, green: 0.898, blue: 0.706, alpha: 1.0)
        }
    }
    class var babyPink: UIColor {
        get {
            return UIColor(red: 1.0, green: 0.706, blue: 0.737, alpha: 1.0)
        }
    }
    class var lilac: UIColor {
        get {
            return UIColor(red: 0.706, green: 0.737, blue: 1.0, alpha: 1.0)
        }
    }
    class var veraman: UIColor {
        get {
            return UIColor(red: 0, green: 0.784, blue: 0.698, alpha: 1.0)
        }
    }
    class var gold: UIColor {
        get {
            return UIColor(red: 0.784, green: 0.698, blue: 0, alpha: 1.0)
        }
    }
    class var strongBlue: UIColor {
        get {
            return UIColor(red: 0, green: 0.478, blue: 0.784, alpha: 1.0)
        }
    }
    class var grayishOrange: UIColor {
        get {
            return UIColor(red: 0.749, green: 0.663, blue: 0.573, alpha: 1.0)
        }
    }
    class var lightSaturatedRed: UIColor {
        get {
            return UIColor(red: 0.71, green: 0.51, blue: 0.514, alpha: 1.0)
        }
    }
    class var darkCyanGreen: UIColor {
        get {
            return UIColor(red: 0.184, green: 0.31, blue: 0.247, alpha: 1.0)
        }
    }
}

extension UIView {
    
    func addAnchors(wAnchor: NSLayoutDimension? = nil, _ wMulti: CGFloat? = nil,
                    hAnchor: NSLayoutDimension? = nil,_ hMulti: CGFloat? = nil,
                    cXAnchor: NSLayoutXAxisAnchor? = nil, cYAnchor: NSLayoutYAxisAnchor? = nil,
                    lAnchor: NSLayoutXAxisAnchor? = nil, leftConstant: CGFloat? = nil,
                    tAnchor: NSLayoutYAxisAnchor? = nil, topConstant: CGFloat? = nil,
                    rAnchor: NSLayoutXAxisAnchor? = nil, rightConstant: CGFloat? = nil,
                    bAnchor: NSLayoutYAxisAnchor? = nil, bottomConstant: CGFloat? = nil) {
        
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
            if topConstant == nil {
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
        if bAnchor != nil {
            if bottomConstant == nil {
                bottomAnchor.constraint(equalTo: bAnchor!, constant: 0).isActive = true
            } else {
                bottomAnchor.constraint(equalTo: bAnchor!, constant: bottomConstant!).isActive = true
            }
        }
    }
    
    func cardView(ofRadius: CGFloat, withShadow: UIColor? = nil) {
        layer.cornerRadius = ofRadius
        if withShadow != nil {
            layer.shadowColor = withShadow!.cgColor
            layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            layer.shadowRadius = 12.0
            layer.shadowOpacity = 0.7
        }
    }
    
}

extension UITableViewController {
    
    func setupTableViewProperties() {
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }
    
    func preventBounce() {
        tableView.bounces = false
        tableView.alwaysBounceVertical = false
    }
    
}

extension UIViewController: UITextFieldDelegate {
    
    func addCancelButton() {
        let cancelButton = UIBarButtonItem(image: UIImage(named: "go_back.png"), style: .plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func goBack() {
        _ = navigationController?.popViewController(animated: true)
    }
    
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
                NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 24.0)!
            ]
        }
       
        navigationController?.navigationBar.barTintColor = AppUtility().primaryColor
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.hero.isEnabled = true
        
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
    
    func set(color: UIColor, forImage: UIImage) {
        setImage(forImage.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
        tintColor = color
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
