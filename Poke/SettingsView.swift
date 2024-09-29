//
//  SettingsView.swift
//  Poke
//
//  Created by Jason Karcheski on 28/09/2024.
//

import Foundation
import SwiftUI

struct SettingsView : View {
	
	@AppStorage(Settings.ExcludeIntimateExams.key) private var settingExcludeIntimateExams: Bool = false
	
	var body: some View {
		VStack {
			Toggle("Exclude intimate exams", isOn: $settingExcludeIntimateExams)
			
			Spacer()
		}
		.navigationTitle("Settings")
		.padding()
	}
	
}

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
