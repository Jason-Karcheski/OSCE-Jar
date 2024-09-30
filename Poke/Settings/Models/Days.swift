//
//  Days.swift
//  Poke
//
//  Created by Jason Karcheski on 29/09/2024.
//

import Foundation

enum Days: String, CaseIterable, Identifiable {
	case Mon, Tue, Wed, Thu, Fri, Sat, Sun
	
	var id: Self { self }
}
