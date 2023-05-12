//
//  ContentView.swift
//  SwiftExtensionContainer
//
//  Created by Matthew Massicotte on 2022-09-07.
//

import SwiftUI
import ProcessServiceContainer

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
			Text("Hello, world!: \(ServiceContainer.name)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
