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
	private(set) var markSchemeLink: String
	private(set) var isIntimate: Bool
	
	init(name: String, geekyMedicsLink: String, markSchemeLink: String, isIntimate: Bool) {
		self.id = UUID().uuidString
		self.name = name
		self.geekyMedicsLink = geekyMedicsLink
		self.markSchemeLink = markSchemeLink
		self.isIntimate = isIntimate
	}
}

