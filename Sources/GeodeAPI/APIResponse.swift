// Copyright © Fleuronic LLC. All rights reserved.

import protocol Catenary.APIResponse

public extension API {
	struct Response {
		private let container: SingleValueDecodingContainer
		private let keyedContainer: KeyedDecodingContainer<CodingKeys>
	}
}

// MARK -
extension API.Response: APIResponse {
	// MARK: Response
	public func resource<Resource: Decodable>() throws -> Resource {
		switch try Status(keyedContainer) {
		case .success:
			let results = try? keyedContainer.decode(Resource.self, forKey: .results)
			return try results ?? container.decode(Resource.self)
		case let .failure(error):
			throw error	
		}
	}
	
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		container = try decoder.singleValueContainer()
		keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
	}
}

// MARK -
private extension API.Response {
	enum CodingKeys: String, CodingKey {
		case status
		case results
		case errorMessage
	}
	
	enum Status {
		case success
		case failure(API.Error)
	}
}

// MARK -
private extension API.Response.Status {
	init(_ container: KeyedDecodingContainer<API.Response.CodingKeys>) throws {
		let value = try container.decode(String.self, forKey: .status)
		
		self = switch value {
		case "OK": 
			.success
		default: 
			.failure(
				.init(
					value: .init(rawValue: value)!,
					message: try container.decode(String.self, forKey: .errorMessage)
				)
			)
		}
	}
}