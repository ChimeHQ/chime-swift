import SwiftUI
import ProcessServiceContainer

@main
struct SwiftExtensionContainerApp: App {
	init() {
		_ = ServiceContainer.name
	}
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
