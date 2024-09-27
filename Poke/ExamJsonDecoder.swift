//
//  ExamsJsonDecoder.swift
//  Poke
//
//  Created by Jason Karcheski on 27/09/2024.
//

import Foundation

struct ExamResponse: Decodable {
	let name: String
	let geekyMedicsLink: String
}

struct ExamJsonDecoder {
	static func decode(from fileName: String) -> [ExamResponse] {
		guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
			  let data = try? Data(contentsOf: url),
			  let exams = try? JSONDecoder().decode([ExamResponse].self, from: data) else {
			return []
		}
		
		return exams
	}
}
