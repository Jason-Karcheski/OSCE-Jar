//
//  ExamModel.swift
//  Poke
//
//  Created by Jason Karcheski on 27/09/2024.
//

import Foundation
import SwiftData

@Model
class Exam {
	@Attribute(.unique) private(set) var id: String
	private(set) var name: String
	private(set) var geekyMedicsLink: String
	
	init(name: String, geekyMedicsLink: String) {
		self.id = UUID().uuidString
		self.name = name
		self.geekyMedicsLink = geekyMedicsLink
	}
}

