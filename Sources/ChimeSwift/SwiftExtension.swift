import Foundation
import ExtensionFoundation
import os.log

import ChimeKit
import LanguageServerProtocol

public final class SwiftExtension {
	let host: any HostProtocol
	private let lspService: LSPService
	private let logger: Logger

	public init(host: any HostProtocol) {
		self.host = host
		self.logger = Logger(subsystem: "com.chimehq.ChimeSwift", category: "SwiftExtension")

		let filter: LSPService.ContextFilter = { (projContext, docContext) in
			let uti = docContext?.uti

			// here is where we could also consider C-based languages
			if uti?.conforms(to: .swiftSource) == true {
				return true
			}

			return SwiftExtension.projectRoot(at: projContext.url)
		}

		self.lspService = LSPService(host: host,
									 contextFilter: filter,
									 executionParamsProvider: SwiftExtension.provideParams)
	}

	private static func projectRoot(at url: URL) -> Bool {
		let enumerator = FileManager.default.enumerator(at: url,
														includingPropertiesForKeys: [.contentTypeKey],
														options: [.skipsSubdirectoryDescendants, .skipsHiddenFiles])


		while let item = enumerator?.nextObject() as? URL {
			let values = try? item.resourceValues(forKeys: [.contentTypeKey])

			if values?.contentType?.conforms(to: .swiftSource) == true {
				return true
			}
		}

		return false
	}
}

extension SwiftExtension {
	private static func provideParams() throws -> Process.ExecutionParameters {
		return .init(path: "/usr/bin/sourcekit-lsp")
	}
}

extension SwiftExtension: ExtensionProtocol {
	public func didOpenProject(with context: ProjectContext) async throws {
		try await lspService.didOpenProject(with: context)
	}

	public func willCloseProject(with context: ProjectContext) async throws {
		try await lspService.willCloseProject(with: context)
	}

	public func symbolService(for context: ProjectContext) async throws -> SymbolQueryService? {
		return try await lspService.symbolService(for: context)
	}

	public func didOpenDocument(with context: DocumentContext) async throws -> URL? {
		return try await lspService.didOpenDocument(with: context)
	}

	public func didChangeDocumentContext(from oldContext: DocumentContext, to newContext: DocumentContext) async throws {
		return try await lspService.didChangeDocumentContext(from: oldContext, to: newContext)
	}

	public func willCloseDocument(with context: DocumentContext) async throws {
		return try await lspService.willCloseDocument(with: context)
	}

	public func documentService(for context: DocumentContext) async throws -> DocumentService? {
		return try await lspService.documentService(for: context)
	}
}
