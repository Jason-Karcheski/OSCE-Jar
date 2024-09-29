//
//  Settings.swift
//  Poke
//
//  Created by Jason Karcheski on 29/09/2024.
//

import Foundation

enum Settings {
	case ExcludeIntimateExams, EnableReminders, ReminderRepeatTime
	
	var key: String {
		return switch self {
		case .ExcludeIntimateExams:
			"settingExcludeIntimateExams"
		case .EnableReminders:
			"settingEnableReminders"
		case .ReminderRepeatTime:
			"settingNotificationRepeatTime"
		}
	}
}
