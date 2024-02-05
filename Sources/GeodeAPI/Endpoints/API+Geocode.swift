// Copyright © Fleuronic LLC. All rights reserved.

import struct Geode.Geocode
import protocol GeodeService.GeocodeSpec
import protocol Catenary.API

extension API: GeocodeSpec {
	public func listGeocodes(for address: String) async -> Self.Result<[Geocode]> {
		let path = "geocode/json?address=\(address)"
		return await getResource(at: path)
	}
}
