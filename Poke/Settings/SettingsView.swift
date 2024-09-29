//
//  SettingsView.swift
//  Poke
//
//  Created by Jason Karcheski on 28/09/2024.
//

import Foundation
import SwiftUI

struct SettingsView : View {
	
	@AppStorage(Settings.HideIntimateExams.key) private var settingExcludeIntimateExams: Bool = false
	@AppStorage(Settings.EnableReminders.key) private var settingEnableReminders: Bool = false
	@AppStorage(Settings.RemindEvery.key) private var settingRemindEvery: ReminderRepeatTiming = .Daily
	@AppStorage(Settings.RemindAtTime.key) private var settingRemindAtTime: Date = Date()
	@AppStorage(Settings.RemindOnDay.key) private var settingRemindOnDay: Days = .Mon
	
	var body: some View {
		List {
			Section("General") {
				Toggle("Hide intimate exams", isOn: $settingExcludeIntimateExams)
			}
			
			Section("Reminders") {
				Toggle("Enable reminders", isOn: $settingEnableReminders)
				
				if settingEnableReminders {
					Picker("Remind every", selection: $settingRemindEvery) {
						Text("Day").tag(ReminderRepeatTiming.Daily)
						Text("Week").tag(ReminderRepeatTiming.Weekly)
					}
					
					DatePicker(
						"Time",
						selection: $settingRemindAtTime,
						displayedComponents: .hourAndMinute
					)
					
					if settingRemindEvery == .Weekly {
						Picker("Day", selection: $settingRemindOnDay) {
							Text("Monday").tag(Days.Mon)
							Text("Tuesday").tag(Days.Tue)
							Text("Wednesday").tag(Days.Wed)
							Text("Thursday").tag(Days.Thu)
							Text("Friday").tag(Days.Fri)
							Text("Saturday").tag(Days.Sat)
							Text("Sunday").tag(Days.Sun)
						}
					}
				}
			}
		}
		.navigationTitle("Settings")
	}	
}
