// Copyright © Fleuronic LLC. All rights reserved.

import struct Geode.TimeZone
import struct Geode.Location
import struct Foundation.TimeInterval
import protocol GeodeService.TimeZoneSpec
import protocol Catenary.API

extension API: TimeZoneSpec {
	public func fetchTimeZone(in location: Location, at timestamp: TimeInterval) async -> Self.Result<TimeZone> {
		let coordinates = "\(location.latitude)%2C\(location.longitude)"
		let path = "timezone/json?location=\(coordinates)&timestamp=\(timestamp)"
		return await getResource(at: path)
	}
}

