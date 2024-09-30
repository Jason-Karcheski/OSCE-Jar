//
//  WebViewStyle.swift
//  Poke
//
//  Created by Jason Karcheski on 30/09/2024.
//

import SwiftUI

struct WebViewStyle : ViewModifier {
	
	func body(content: Content) -> some View {
		content
			.navigationBarTitleDisplayMode(.inline)
			.ignoresSafeArea()
	}
	
}

