//
//  ContentView.swift
//  Poke
//
//  Created by Jason Karcheski on 27/09/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	
	@Environment(\.modelContext) private var context
	@Query private var exam: [Exam]
	@State private var currentExam: Exam? = nil
	@State private var presentWebView: Bool = false
	@State private var presentSettings: Bool = false
	@State private var settingExcludeIntrusiveExams = false
	
    var body: some View {
		NavigationStack {
			VStack {
				Spacer()
				
				Text(currentExam?.name ?? "No Exam Found")
					.font(.largeTitle)
					.multilineTextAlignment(.center)
					.padding()
				
				Spacer()
				
				HStack {
					Button {
						presentWebView = true
					} label: {
						HStack {
							Image(systemName: "book")
							Text("Geeky Medics")
						}
					}
					.buttonStyle(.bordered)
					
					Button {
						updateCurrentExam()
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
					presentSettings = true
				} label: {
					Image(systemName: "gear")
				}

			}
		}
		.onAppear { updateCurrentExam() }
		.sheet(isPresented: $presentWebView) {
			VStack {
				Text(currentExam?.name ?? "Geeky Medics")
					.padding()
				
				WebView(url: URL(string: currentExam?.geekyMedicsLink ?? "https://www.google.com")!)
					.ignoresSafeArea()
			}
		}
		.sheet(isPresented: $presentSettings) {
			VStack {
				Text("Settings")
					.padding()
				
				Toggle("Exclude intimate exams", isOn: $settingExcludeIntrusiveExams)
			}
			.padding()
		}
    }
	
	func updateCurrentExam() {
		currentExam = exam.filter { $0.id != currentExam?.id }.randomElement()
	}
}

#Preview {
    ContentView()
}
