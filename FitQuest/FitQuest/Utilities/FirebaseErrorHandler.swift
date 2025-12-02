//
//  FirebaseErrorHandler.swift
//  FitQuest
//
//  Created by Sunny Yadav on 12/2/25.
//

import Foundation
import FirebaseAuth

struct FirebaseErrorHandler {
    
    static func getErrorMessage(from error: Error) -> String {
        let nsError = error as NSError
        
        // Check if it's a Firebase Auth error
        guard nsError.domain == AuthErrorDomain else {
            return error.localizedDescription
        }
        
        // Cast to AuthErrorCode directly
        guard let errorCode = AuthErrorCode(_bridgedNSError: nsError) else {
            return "Authentication failed. Please check your credentials and try again."
        }
        
        switch errorCode.code {
        // Login Errors
        case .invalidEmail:
            return "The email address is invalid."
        case .wrongPassword:
            return "The password is incorrect."
        case .userNotFound:
            return "No account found with this email address."
        case .userDisabled:
            return "This account has been disabled."
        case .invalidCredential:
            return "Invalid email or password. Please check your credentials."
        case .userTokenExpired, .invalidUserToken:
            return "Your session has expired. Please sign in again."
            
        // Registration Errors
        case .emailAlreadyInUse:
            return "This email is already registered. Please sign in instead."
        case .weakPassword:
            return "The password is too weak. Please use at least 6 characters."
        case .operationNotAllowed:
            return "Email/password accounts are not enabled. Please contact support."
            
        // Network & System Errors
        case .networkError:
            return "Network error. Please check your connection."
        case .tooManyRequests:
            return "Too many unsuccessful attempts. Please try again later."
        case .internalError:
            return "An internal error occurred. Please try again later."
            
        // Validation Errors
        case .missingEmail:
            return "Please provide an email address."
//        case .missing:
//            return "Please provide a password."
            
        // Token/Credential Errors
        case .invalidCustomToken, .customTokenMismatch:
            return "Authentication token error. Please sign in again."
        case .credentialAlreadyInUse:
            return "This credential is already associated with a different user account."
        case .accountExistsWithDifferentCredential:
            return "An account already exists with the same email but different sign-in credentials."
            
        // Session Errors
        case .requiresRecentLogin:
            return "This operation requires recent authentication. Please log in again."
        case .sessionExpired:
            return "Your session has expired. Please sign in again."
            
        // Verification Errors
        case .invalidVerificationCode:
            return "The verification code is invalid."
        case .invalidVerificationID:
            return "The verification ID is invalid."
        case .missingVerificationCode:
            return "Please provide a verification code."
            
        // Action Code Errors
        case .expiredActionCode:
            return "This link has expired."
        case .invalidActionCode:
            return "This link is invalid or has already been used."
            
        // Default fallback
        default:
            // Log the actual error for debugging
            print("⚠️ Unhandled Firebase Auth Error: \(errorCode.code.rawValue) - \(error.localizedDescription)")
            return "Authentication failed. Please check your credentials and try again."
        }
    }
}
