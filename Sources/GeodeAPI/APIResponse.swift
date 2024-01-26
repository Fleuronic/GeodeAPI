// Copyright © Fleuronic LLC. All rights reserved.

import protocol Catenary.APIResponse

public extension API {
	struct Response: APIResponse {
		private enum CodingKeys: String, CodingKey {
			case results
		}
		
		private let container: KeyedDecodingContainer<CodingKeys>
		
		// MARK: Response
		public func resource<Resource: Decodable>() throws -> Resource {
			try container.decode(Resource.self, forKey: .results)
		}
		
		// MARK: Decodable
		public init(from decoder: Decoder) throws {
			container = try decoder.container(keyedBy: CodingKeys.self)
		}
	}
}
