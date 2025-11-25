//
//  AccountSettingsViewController.swift
//  FitQuest
//
//  Created by Rushad Daruwalla on 11/24/25.
//

import UIKit

class AccountSettingsViewController: UIViewController {
    
    let accountView = AccountSettingsView()
    let dateFormatter = DateFormatter()
    
    override func loadView() {
        view = accountView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // Date formatter for DOB
        dateFormatter.dateFormat = "MM/dd/yyyy"
        accountView.datePicker.addTarget(self,
                                         action: #selector(dateChanged),
                                         for: .valueChanged)
        
        // Tap logo to go back
        let logoTap = UITapGestureRecognizer(target: self,
                                             action: #selector(onLogoTapped))
        accountView.logoImageView.addGestureRecognizer(logoTap)
        
        // Buttons
        accountView.saveButton.addTarget(self,
                                         action: #selector(onSaveTapped),
                                         for: .touchUpInside)
        accountView.logoutButton.addTarget(self,
                                           action: #selector(onLogoutTapped),
                                           for: .touchUpInside)
        
        // TODO: Load current user data from Firebase and populate fields
        // e.g. accountView.usernameTextField.text = user.username
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc func dateChanged() {
        let selectedDate = accountView.datePicker.date
        accountView.dateOfBirthTextField.text = dateFormatter.string(from: selectedDate)
    }
    
    @objc func onLogoTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func onSaveTapped() {
        // Grab values
        let username = accountView.usernameTextField.text ?? ""
        let email = accountView.emailTextField.text ?? ""
        let password = accountView.passwordTextField.text ?? ""
        let firstName = accountView.firstNameTextField.text ?? ""
        let lastName = accountView.lastNameTextField.text ?? ""
        let dob = accountView.dateOfBirthTextField.text ?? ""
        
        print("Saving account settings:")
        print("username=\(username), email=\(email), first=\(firstName), last=\(lastName), dob=\(dob)")
        
        // TODO: Save these to Firebase Auth / Firestore
        // This is intentionally left open for implementation.
    }
    
    @objc func onLogoutTapped() {
        print("Log out tapped")
        
        // TODO: Add Firebase signOut() here later
        
        // Go to Sign In screen (ViewController) and reset the stack
        let loginVC = ViewController()
        navigationController?.setViewControllers([loginVC], animated: true)
    }

}
