//
//  Settings.swift
//  Poke
//
//  Created by Jason Karcheski on 29/09/2024.
//

import Foundation

enum Settings {
	case HideIntimateExams, EnableReminders, RemindEvery, RemindAtTime, RemindOnDay
	
	var key: String {
		return switch self {
		case .HideIntimateExams:
			"settingExcludeIntimateExams"
		case .EnableReminders:
			"settingEnableReminders"
		case .RemindEvery:
			"settingRemindEvery"
		case .RemindAtTime:
			"settingRemindAtDaily"
		case .RemindOnDay:
			"settingRemindAtWeekly"
		}
	}
}
