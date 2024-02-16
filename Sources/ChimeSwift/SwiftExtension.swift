import Foundation

import ChimeKit

@MainActor
public final class SwiftExtension {
	let host: any HostProtocol
	private let lspService: LSPService

	public init(host: any HostProtocol) {
		self.host = host

		let paramProvider = { try await SwiftExtension.provideParams(host: host) }

		self.lspService = LSPService(host: host,
									 executionParamsProvider: paramProvider)
	}
}

extension SwiftExtension {
	private static func provideParams(host: any HostProtocol) async throws -> Process.ExecutionParameters {
		let userEnv = try await host.captureUserEnvironment()

		return .init(path: "/usr/bin/sourcekit-lsp", environment: userEnv)
	}
}

extension SwiftExtension: ExtensionProtocol {
	public var configuration: ExtensionConfiguration {
		ExtensionConfiguration(contentFilter: [.uti(.swiftSource)])
	}

	public var applicationService: some ApplicationService {
		return lspService
	}
}
