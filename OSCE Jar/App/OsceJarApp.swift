//
//  PokeApp.swift
//  Poke
//
//  Created by Jason Karcheski on 27/09/2024.
//

import SwiftUI
import SwiftData

@main
struct OsceJarApp: App {
	
	@AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
	
    var body: some Scene {
		WindowGroup {
            RootView()
        }
		.modelContainer(ExamContainer.create(shouldCreateDefaults: &isFirstLaunch))
    }
}
