// Copyright © Fleuronic LLC. All rights reserved.

import InitMacro

import struct Geode.Geocode
import protocol Catenary.API

@Init public struct API {
	private let apiKey: String
}

// MARK: -
extension API: RESTAPI {
	// MARK: API
	public var baseURL: URL {
		URL(string: "https://maps.googleapis.com/maps/api/geocode/json?key=\(apiKey)&")!
	}
}
