//
//  AuthService.swift
//  FitQuest
//
//  Created by Sunny Yadav on 12/2/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class AuthService {
    
    static let shared = AuthService()
    private let auth = Auth.auth()
    private let database = Firestore.firestore()
    private let storage = Storage.storage()
    
    private init() {}
    
    // MARK: - Sign In
    func signIn(email: String, password: String) async throws {
        try await auth.signIn(withEmail: email, password: password)
    }
    
    // MARK: - Create User
    func createUser(email: String, password: String) async throws -> String {
        let result = try await auth.createUser(withEmail: email, password: password)
        return result.user.uid
    }
    
    // MARK: - Update Auth Profile
    func updateAuthProfile(userId: String, name: String, photoURL: URL?) async throws {
        guard let user = auth.currentUser else {
            throw NSError(domain: "AuthService", code: -1, userInfo: [NSLocalizedDescriptionKey: "No authenticated user"])
        }
        
        let changeRequest = user.createProfileChangeRequest()
        changeRequest.displayName = name
        changeRequest.photoURL = photoURL
        try await changeRequest.commitChanges()
    }
    
    // MARK: - Send Password Reset
    func sendPasswordReset(email: String) async throws {
        try await auth.sendPasswordReset(withEmail: email)
    }
    
    // MARK: - Sign Out
    func signOut() throws {
        try auth.signOut()
    }
    
    // MARK: - Get Current User ID
    var currentUserId: String? {
        return auth.currentUser?.uid
    }
    
    // MARK: - Check if User is Logged In
    var isUserLoggedIn: Bool {
        return auth.currentUser != nil
    }
}
