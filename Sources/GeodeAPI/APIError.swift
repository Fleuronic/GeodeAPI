// Copyright © Fleuronic LLC. All rights reserved.

import protocol Catenary.APIError

public extension API {
	enum Error {
		case zeroResults
	}
}

// MARK -
extension API.Error: APIError {
	public var message: String { "" }
}
