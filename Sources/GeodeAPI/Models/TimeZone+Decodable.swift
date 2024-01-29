// Copyright © Fleuronic LLC. All rights reserved.

import struct Geode.TimeZone

extension TimeZone: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.init(
			name: try container.decode(String.self, forKey: .name),
			timeZoneID: try container.decode(String.self, forKey: .timeZoneID)
		)
	}
}

// MARK -
private extension TimeZone {
	enum CodingKeys: String, CodingKey {
		case name = "timeZoneName"
		case timeZoneID = "timeZoneId"
	}
}
