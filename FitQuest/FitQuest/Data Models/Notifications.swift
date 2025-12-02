//
//  Notifications.swift
//  FitQuest
//
//  Created by Sunny Yadav on 12/2/25.
//

import Foundation

// MARK: - Notification Type
enum NotificationType: String, Codable {
    case taskReminder = "task_reminder"
    case streakReminder = "streak_reminder"
    case dailySummary = "daily_summary"
    case levelUp = "level_up"
    
    var icon: String {
        switch self {
        case .taskReminder: return "bell.fill"
        case .streakReminder: return "flame.fill"
        case .dailySummary: return "chart.bar.fill"
        case .levelUp: return "star.circle.fill"
        }
    }
}

// MARK: - App Notification Model
struct AppNotification: Codable, Identifiable {
    var id: String?
    let userId: String
    let type: NotificationType
    let title: String
    let message: String
    let relatedId: String? // Task ID, etc.
    var isRead: Bool
    let createdAt: Date
    
    init(id: String? = nil, userId: String, type: NotificationType,
         title: String, message: String, relatedId: String? = nil,
         isRead: Bool = false, createdAt: Date = Date()) {
        self.id = id
        self.userId = userId
        self.type = type
        self.title = title
        self.message = message
        self.relatedId = relatedId
        self.isRead = isRead
        self.createdAt = createdAt
    }
}
