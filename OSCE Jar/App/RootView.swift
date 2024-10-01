//
//  ContentView.swift
//  Poke
//
//  Created by Jason Karcheski on 27/09/2024.
//

import SwiftUI
import SwiftData

struct RootView: View {
	
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
					navigateToRoute(route)
				}
		}
		.onAppear {
			navigationPath.append(Route.Root)
		}
		.tint(.green)
    }
	
	func updateCurrentExam() {
		let examList = exam.filter { $0.id != currentExam?.id }
		
		let newExam = if excludeIntimateExams {
			examList.filter { $0.isIntimate == false }.randomElement()
		} else {
			examList.randomElement()
		}
		
		print("New Exam \n- Name: \(String(describing: newExam?.name)) \n- Geeky Medics Link: \(String(describing: newExam?.geekyMedicsLink)) \n- Intimate Exam: \(String(describing: newExam?.isIntimate))")
		
		currentExam = newExam
	}
	
	@ViewBuilder
	func navigateToRoute(_ route: Route) -> some View {
		switch route {
		case .Root:
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
		case .Settings:
			SettingsView()
		case .Web:
			WebView(url: URL(string: currentExam?.geekyMedicsLink ?? "https://www.google.com")!)
				.navigationTitle(currentExam?.name ?? "Geeky Medics")
				.modifier(WebViewStyle())
		case .MarkScheme:
			WebView(url: URL(string: currentExam?.markSchemeLink ?? "https://www.google.com")!)
				.navigationTitle(currentExam?.name ?? "Geeky Medics")
				.modifier(WebViewStyle())
		}
	}
}

#Preview {
    RootView()
}
