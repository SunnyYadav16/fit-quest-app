//
//  StatsScreenViewController.swift
//  FitQuest
//
//  Created by Rushad Daruwalla on 11/18/25.
//

import UIKit

class StatsScreenViewController: UIViewController {
    
    let statsView = StatsScreenView()
    
    override func loadView() {
        view = statsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        statsView.notificationButton.addTarget(self,
                                               action: #selector(onNotificationsTapped),
                                               for: .touchUpInside)
        
        let logoTap = UITapGestureRecognizer(target: self, action: #selector(onLogoTapped))
        statsView.logoImageView.addGestureRecognizer(logoTap)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc func onNotificationsTapped() {
        print("Stats notifications tapped")
        // TODO: show notifications/settings
    }
    
    @objc func onLogoTapped() {
        print("Stats logo tapped - going back")
        navigationController?.popViewController(animated: true)
    }
}
