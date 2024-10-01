//
//  AppWebView.swift
//  Poke
//
//  Created by Jason Karcheski on 27/09/2024.
//

import Foundation
import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
	
	let url: URL
	
	func makeUIView(context: Context) -> WKWebView {
		return WKWebView()
	}
	
	func updateUIView(_ webView: WKWebView, context: Context) {
		let request = URLRequest(url: url)
		webView.load(request)
	}
	
}


