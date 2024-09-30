//
//  NotificationManager.swift
//  Poke
//
//  Created by Jason Karcheski on 30/09/2024.
//

import Foundation
import UserNotifications

class NotificationManager {
	
	static let instance = NotificationManager()
	
	func requestAuthorisation() {
		let options: UNAuthorizationOptions = [.alert]
		UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
			if let error = error {
				print("Notification Manager: Error - \(error)")
			} else {
				print("Notification Manager: Notification autorisation completed successfully")
			}
		}
	}
	
	func scheduleNotification() {
		let content = UNMutableNotificationContent()
		content.title = "Quick Reminder"
		content.body = "Is now a good time to practice?"
		
		let trigger = createNotificationTrigger()
		
		let request = UNNotificationRequest(
			identifier: UUID().uuidString,
			content: content,
			trigger: trigger
		)
		
		UNUserNotificationCenter.current().add(request)
	}
	
	private func createNotificationTrigger() -> UNNotificationTrigger {
		let reminderInterval = UserDefaults.standard.object(forKey: Settings.RemindEvery.key)
		print(String(describing: reminderInterval))
		
		return UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
	}
	
}

