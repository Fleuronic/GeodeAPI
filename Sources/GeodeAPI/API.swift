// Copyright © Fleuronic LLC. All rights reserved.

import InitMacro

import struct Foundation.URL
import protocol Catenary.RESTAPI

@Init public struct API {
	private let apiKey: String
}

// MARK: -
extension API: RESTAPI {
	// MARK: API
	public func url(for path: String) -> URL {
		URL(string: "https://maps.googleapis.com/maps/api/\(path)&key=\(apiKey)")!
	}
}
