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
			
			ButtonLayout(
				navigationPath: $navigationPath,
				currentExam: currentExam,
				updateExam: updateExam
			)
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

fileprivate struct ButtonLayout: View {
	
	@Binding var navigationPath: NavigationPath
	let currentExam: Exam?
	let updateExam: () -> Void
	
	var body: some View {
		VStack {
			Button {
				updateExam()
			} label: {
				HStack {
					Image(systemName: "arrow.clockwise")
					Text("Refresh")
						.frame(maxWidth: .infinity)
				}
			}
			.padding(.horizontal)
			.buttonStyle(.borderedProminent)
			
			HStack {
				Button {
					if currentExam != nil {
						navigationPath.append(Route.Web(url: currentExam?.geekyMedicsLink))
					}
				} label: {
					HStack {
						Image(systemName: "book.fill")
						Text("Guide")
							.frame(maxWidth: .infinity)
					}
				}
				.buttonStyle(.bordered)
				
				if currentExam?.geekyMedicsLink != currentExam?.markSchemeLink {
					Button {
						if currentExam != nil {
							navigationPath.append(Route.Web(url: currentExam?.markSchemeLink))
						}
					} label: {
						HStack {
							Image(systemName: "checkmark.circle.fill")
							Text("Checklist")
								.frame(maxWidth: .infinity)
						}
					}
					.buttonStyle(.bordered)
				}
			}
			.padding(.horizontal)
			.safeAreaPadding(.bottom)
		}
	}
	
}

#Preview {
	ExamView(
		navigationPath: .constant(NavigationPath()),
		currentExam: Exam(
			name: "Preview Exam",
			geekyMedicsLink: "guidelink",
			markSchemeLink: "checklistlink",
			isIntimate: false
		),
		updateExam: {}
	)
}

