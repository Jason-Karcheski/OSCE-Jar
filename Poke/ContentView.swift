//
//  ContentView.swift
//  Poke
//
//  Created by Jason Karcheski on 27/09/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	
	@AppStorage(Settings.HideIntimateExams.key) private var excludeIntimateExams: Bool = false
	@Environment(\.modelContext) private var context
	@Query private var exam: [Exam]
	@State private var currentExam: Exam? = nil
	@State private var navigationPath = NavigationPath()
	@State private var isFirstShow: Bool = true
	
    var body: some View {
		NavigationStack(path: $navigationPath) {
			ProgressView()
				.frame(
					width: .infinity,
					height: .infinity,
					alignment: .center
				)
				.navigationDestination(for: Route.self) { route in
					switch route {
					case .Settings:
						SettingsView()
					case .Web:
						AppWebView(url: URL(string: currentExam?.geekyMedicsLink ?? "https://www.google.com")!)
							.navigationTitle(currentExam?.name ?? "Geeky Medics")
							.navigationBarTitleDisplayMode(.inline)
							.ignoresSafeArea()
					default:
						ExamView(
							navigationPath: $navigationPath,
							currentExam: currentExam,
							updateExam: { updateCurrentExam() }
						)
						.navigationBarBackButtonHidden()
						.onAppear {
							if isFirstShow {
								updateCurrentExam()
							}
							
							isFirstShow = false
						}
					}
				}
		}
		.onAppear {
			navigationPath.append(Route.Root)
		}
		.tint(.green)
    }
	
	func updateCurrentExam() {
		let newExam = if excludeIntimateExams {
			exam.filter { $0.id != currentExam?.id }
				.filter { $0.isIntimate == false }
				.randomElement()
		} else {
			exam.filter { $0.id != currentExam?.id }
				.randomElement()
		}
		
		print("New Exam \n- Name: \(String(describing: newExam?.name)) \n- Geeky Medics Link: \(String(describing: newExam?.geekyMedicsLink)) \n- Intimate Exam: \(String(describing: newExam?.isIntimate))")
		
		currentExam = newExam
	}
}

#Preview {
    ContentView()
}
