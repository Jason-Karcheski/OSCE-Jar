//
//  ExamView.swift
//  Poke
//
//  Created by Jason Karcheski on 28/09/2024.
//

import Foundation
import SwiftUI

struct ExamView : View {
	
	@Binding var navigationPath: NavigationPath
	let currentExam: Exam?
	let updateExam: () -> Void
	
	var body: some View {
		VStack {
			Spacer()
			
			Text(currentExam?.name ?? "No Exam Found")
				.font(.largeTitle)
				.multilineTextAlignment(.center)
				.padding()
			
			Spacer()
			
			HStack {
				Button {
					if currentExam != nil {
						navigationPath.append(Route.Web)
					}
				} label: {
					HStack {
						Image(systemName: "book")
						Text("Geeky Medics")
					}
				}
				.buttonStyle(.bordered)
				
				Button {
					updateExam()
				} label: {
					HStack {
						Image(systemName: "arrow.clockwise")
						Text("Refresh")
					}
				}
				.buttonStyle(.borderedProminent)
			}
		}
		.navigationTitle("OSCE Jar")
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			Button {
				navigationPath.append(Route.Settings)
			} label: {
				Image(systemName: "gear")
			}
		}
	}
	
}

