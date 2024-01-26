// Copyright © Fleuronic LLC. All rights reserved.

import protocol Catenary.APIError

public extension API {
	struct Error: APIError {
		public let value: Value
		public let message: String
	}
}

// MARK -
public extension API.Error {
	enum Value: String, Decodable {
		case zeroResults = "ZERO_RESULTS"		
		case overDailyLimit = "OVER_DAILY_LIMIT"		
		case overQueryLimit = "OVER_QUERY_LIMIT"		
		case requestDenied = "REQUEST_DENIED"		
		case invalidRequest = "INVALID_REQUEST"		
		case unknownError = "UNKNOWN_ERROR"		
	}
}
