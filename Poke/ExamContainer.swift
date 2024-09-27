//
//  ExamContainer.swift
//  Poke
//
//  Created by Jason Karcheski on 27/09/2024.
//

import Foundation
import SwiftData

actor ExamContainer {
	
	@MainActor
	static func create(shouldCreateDefaults: inout Bool) -> ModelContainer {
		let schema = Schema([Exam.self])
		let config = ModelConfiguration()
		let container = try! ModelContainer(for: schema, configurations: config)
		
		if shouldCreateDefaults {
			let exams = ExamJsonDecoder.decode(from: "ExamDefaults")
			if exams.isEmpty == false {
				exams.forEach { item in
					let exam = Exam(name: item.name, geekyMedicsLink: item.geekyMedicsLink)
					container.mainContext.insert(exam)
				}
			}
			
			shouldCreateDefaults = false
		}
		
		return container
	}
	
}
