//
//  ReminderRepeatTiming.swift
//  Poke
//
//  Created by Jason Karcheski on 29/09/2024.
//

import Foundation

enum ReminderRepeatTiming: String, CaseIterable, Identifiable {
	case Daily, Weekly
	var id: Self { self }
}

