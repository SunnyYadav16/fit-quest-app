//
//  Protocols.swift
//  FitQuest
//
//  Created by Sunny Yadav on 12/2/25.
//

import UIKit

// MARK: - Keyboard Protocol
protocol KeyboardProtocol {
    func hideKeyboardOnTapOutside()
}

// MARK: - Alert Protocol
protocol AlertProtocol {
    func showAlert(title: String, message: String)
}

// MARK: - Loading Indicator Protocol
protocol LoadingIndicatorProtocol {
    func showLoadingIndicator()
    func hideLoadingIndicator()
}
