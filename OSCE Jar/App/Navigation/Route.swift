//
//  Route.swift
//  Poke
//
//  Created by Jason Karcheski on 28/09/2024.
//

import Foundation

enum Route: Hashable {
	case Root, Settings, Web(url: String?)
}

