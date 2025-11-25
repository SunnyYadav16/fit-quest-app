//
//  AccountSettingsView.swift
//  FitQuest
//
//  Created by Rushad Daruwalla on 11/24/25.
//

import UIKit

class AccountSettingsView: UIView {
    
    // MARK: - Scroll + Content
    var scrollView: UIScrollView!
    var contentView: UIView!
    
    // MARK: - Header
    var logoImageView: UIImageView!
    var titleLabel: UILabel!
    
    // MARK: - Profile Avatar
    var profileImageView: UIImageView!
    
    // MARK: - Fields
    var usernameTextField: UITextField!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var firstNameTextField: UITextField!
    var lastNameTextField: UITextField!
    var dateOfBirthTextField: UITextField!
    
    // Date picker for DOB
    var datePicker: UIDatePicker!
    
    // MARK: - Actions
    var saveButton: UIButton!
    var logoutButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.08, green: 0.15, blue: 0.25, alpha: 1.0)
        
        setupScrollView()
        setupHeader()
        setupProfileImage()
        setupFields()
        setupButtons()
        setupDatePicker()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        
        contentView = UIView()
        contentView.backgroundColor = .clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
    }
    
    func setupHeader() {
        logoImageView = UIImageView()
        logoImageView.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: .medium)
        logoImageView.image = UIImage(systemName: "arrow.up.heart.fill", withConfiguration: config)
        logoImageView.tintColor = UIColor(red: 0.33, green: 0.67, blue: 0.93, alpha: 1.0)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.isUserInteractionEnabled = true   // tap to go back/home
        contentView.addSubview(logoImageView)
        
        titleLabel = UILabel()
        titleLabel.text = "Account Settings"
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
    }
    
    func setupProfileImage() {
        profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.image = UIImage(systemName: "person.circle.fill")
        profileImageView.tintColor = UIColor(red: 0.62, green: 0.79, blue: 0.97, alpha: 1.0)
        profileImageView.layer.cornerRadius = 40
        profileImageView.clipsToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileImageView)
    }
    
    private func makeTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textColor = .white
        textField.font = .systemFont(ofSize: 16)
        textField.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.33, green: 0.67, blue: 0.93, alpha: 0.5).cgColor
        textField.layer.cornerRadius = 25
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    func setupFields() {
        usernameTextField = makeTextField(placeholder: "Username")
        emailTextField = makeTextField(placeholder: "Email")
        emailTextField.keyboardType = .emailAddress
        
        passwordTextField = makeTextField(placeholder: "Password")
        passwordTextField.isSecureTextEntry = true
        
        firstNameTextField = makeTextField(placeholder: "First name")
        firstNameTextField.autocapitalizationType = .words
        
        lastNameTextField = makeTextField(placeholder: "Last name")
        lastNameTextField.autocapitalizationType = .words
        
        dateOfBirthTextField = makeTextField(placeholder: "Date of birth")
        
        contentView.addSubview(usernameTextField)
        contentView.addSubview(emailTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(firstNameTextField)
        contentView.addSubview(lastNameTextField)
        contentView.addSubview(dateOfBirthTextField)
    }
    
    func setupButtons() {
        saveButton = UIButton(type: .system)
        saveButton.setTitle("Save changes", for: .normal)
        saveButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = UIColor(red: 0.33, green: 0.67, blue: 0.93, alpha: 1.0)
        saveButton.layer.cornerRadius = 25
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(saveButton)
        
        logoutButton = UIButton(type: .system)
        logoutButton.setTitle("Log out", for: .normal)
        logoutButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        logoutButton.setTitleColor(UIColor.red, for: .normal)
        logoutButton.backgroundColor = .clear
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(logoutButton)
    }
    
    func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        // Reasonable DOB limits (similar to RegisterView)
        var comps = DateComponents()
        comps.year = -100
        let minDate = Calendar.current.date(byAdding: comps, to: Date())
        datePicker.minimumDate = minDate
        
        comps.year = -13
        let maxDate = Calendar.current.date(byAdding: comps, to: Date())
        datePicker.maximumDate = maxDate
        
        dateOfBirthTextField.inputView = datePicker
    }
    
    // MARK: - Constraints
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            // ScrollView
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Header
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            logoImageView.widthAnchor.constraint(equalToConstant: 30),
            logoImageView.heightAnchor.constraint(equalToConstant: 30),
            
            titleLabel.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // Profile image
            profileImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            
            // Fields
            usernameTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30),
            usernameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            usernameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            usernameTextField.heightAnchor.constraint(equalToConstant: 48),
            
            emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            firstNameTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            firstNameTextField.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            firstNameTextField.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 48),
            
            lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 16),
            lastNameTextField.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            lastNameTextField.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 48),
            
            dateOfBirthTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 16),
            dateOfBirthTextField.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            dateOfBirthTextField.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            dateOfBirthTextField.heightAnchor.constraint(equalToConstant: 48),
            
            // Buttons
            saveButton.topAnchor.constraint(equalTo: dateOfBirthTextField.bottomAnchor, constant: 30),
            saveButton.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            saveButton.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            
            logoutButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            logoutButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            logoutButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
    }
}
