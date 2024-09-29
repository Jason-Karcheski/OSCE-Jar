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
	@AppStorage(Settings.EnableReminders.key) private var settingEnableReminders: Bool = false
	@AppStorage(Settings.ReminderRepeatTime.key) private var settingReminderTiming: ReminderRepeatTiming = .Daily
	
	var body: some View {
		List {
			Section("General") {
				Toggle("Hide intimate exams", isOn: $settingExcludeIntimateExams)
			}
			
			Section("Reminders") {
				Toggle("Enable reminders", isOn: $settingEnableReminders)
				
				if settingEnableReminders {
					Picker("Reminder timing", selection: $settingReminderTiming) {
						Text("Daily").tag(ReminderRepeatTiming.Daily)
						Text("Weekly").tag(ReminderRepeatTiming.Weekly)
					}
				}
			}
		}
		.navigationTitle("Settings")
	}
	
}


enum ReminderRepeatTiming: String, CaseIterable, Identifiable {
	case Daily, Weekly
	var id: Self { self }
}
