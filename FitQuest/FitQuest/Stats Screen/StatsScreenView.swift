//
//  StatsScreenView.swift
//  FitQuest
//
//  Created by Rushad Daruwalla on 11/18/25.
//

import UIKit

class StatsScreenView: UIView {
    
    // MARK: - Header
    var logoImageView: UIImageView!
    var appNameLabel: UILabel!
    var notificationButton: UIButton!
    
    // MARK: - Title
    var statsTitleLabel: UILabel!
    
    // MARK: - Radar Chart
    var radarView: StatsRadarView!
    
    // Category labels
    var physicalLabel: UILabel!
    var mentalLabel: UILabel!
    var socialLabel: UILabel!
    var creativityLabel: UILabel!
    var miscellaneousLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.08, green: 0.15, blue: 0.25, alpha: 1.0)
        
        setupHeader()
        setupTitle()
        setupRadarChart()
        setupCategoryLabels()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupHeader() {
        // Same logo as other screens
        logoImageView = UIImageView()
        logoImageView.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium)
        logoImageView.image = UIImage(systemName: "arrow.up.heart.fill", withConfiguration: config)
        logoImageView.tintColor = UIColor(red: 0.33, green: 0.67, blue: 0.93, alpha: 1.0)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.isUserInteractionEnabled = true   // tap to go home
        self.addSubview(logoImageView)
        
        appNameLabel = UILabel()
        appNameLabel.text = "FITQUEST"
        appNameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        appNameLabel.textColor = .white
        appNameLabel.textAlignment = .center
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(appNameLabel)
        
        notificationButton = UIButton(type: .system)
        let bellConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .regular)
        notificationButton.setImage(UIImage(systemName: "bell", withConfiguration: bellConfig), for: .normal)
        notificationButton.tintColor = UIColor(red: 0.62, green: 0.79, blue: 0.97, alpha: 1.0)
        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(notificationButton)
    }
    
    func setupTitle() {
        statsTitleLabel = UILabel()
        statsTitleLabel.text = "Stats"
        statsTitleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        statsTitleLabel.textColor = UIColor(red: 0.33, green: 0.67, blue: 0.93, alpha: 1.0)
        statsTitleLabel.textAlignment = .center
        statsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(statsTitleLabel)
    }
    
    func setupRadarChart() {
        radarView = StatsRadarView()
        radarView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(radarView)
    }
    
    func makeCategoryLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func setupCategoryLabels() {
        physicalLabel = makeCategoryLabel(text: "Physical")
        mentalLabel = makeCategoryLabel(text: "Mental")
        socialLabel = makeCategoryLabel(text: "Social")
        creativityLabel = makeCategoryLabel(text: "Creativity")
        miscellaneousLabel = makeCategoryLabel(text: "Miscellaneous")
        
        self.addSubview(physicalLabel)
        self.addSubview(mentalLabel)
        self.addSubview(socialLabel)
        self.addSubview(creativityLabel)
        self.addSubview(miscellaneousLabel)
    }
    
    // MARK: - Constraints
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Header
            logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            logoImageView.widthAnchor.constraint(equalToConstant: 35),
            logoImageView.heightAnchor.constraint(equalToConstant: 35),
            
            appNameLabel.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            appNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            notificationButton.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            notificationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            notificationButton.widthAnchor.constraint(equalToConstant: 32),
            notificationButton.heightAnchor.constraint(equalToConstant: 32),
            
            // Title
            statsTitleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            statsTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            statsTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            // Radar view
            radarView.topAnchor.constraint(equalTo: statsTitleLabel.bottomAnchor, constant: 32),
            radarView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            radarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            radarView.heightAnchor.constraint(equalTo: radarView.widthAnchor)
        ])
        
        // Category labels around the radar – tighter so they stay on-screen
        // Category labels around the radar
        NSLayoutConstraint.activate([
            // Top (Physical)
            physicalLabel.bottomAnchor.constraint(equalTo: radarView.topAnchor, constant: -6),
            physicalLabel.centerXAnchor.constraint(equalTo: radarView.centerXAnchor),
            
            // Left middle (Mental)
            mentalLabel.centerYAnchor.constraint(equalTo: radarView.centerYAnchor, constant: -6),
            mentalLabel.trailingAnchor.constraint(equalTo: radarView.leadingAnchor, constant: -4),
            mentalLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 8),
            
            // Right middle (Social)
            socialLabel.centerYAnchor.constraint(equalTo: radarView.centerYAnchor, constant: -6),
            socialLabel.leadingAnchor.constraint(equalTo: radarView.trailingAnchor, constant: 4),
            socialLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -8),
            
            // Bottom-left (Creativity)
            creativityLabel.topAnchor.constraint(equalTo: radarView.bottomAnchor, constant: 6),
            creativityLabel.centerXAnchor.constraint(equalTo: radarView.centerXAnchor, constant: -80),
            creativityLabel.widthAnchor.constraint(equalTo: radarView.widthAnchor, multiplier: 0.4),
            
            // Bottom-right (Miscellaneous)
            miscellaneousLabel.topAnchor.constraint(equalTo: radarView.bottomAnchor, constant: 6),
            miscellaneousLabel.centerXAnchor.constraint(equalTo: radarView.centerXAnchor, constant: 80),
            miscellaneousLabel.widthAnchor.constraint(equalTo: radarView.widthAnchor, multiplier: 0.4)
        ])
    }
}
