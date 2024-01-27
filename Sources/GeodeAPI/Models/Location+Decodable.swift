import struct Geode.Location

extension Location: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.init(
			latitude: try container.decode(Double.self, forKey: .latitude),
			longitude: try container.decode(Double.self, forKey: .longitude)
		)
	}
}

// MARK -
private extension Location {
	enum CodingKeys: String, CodingKey {
		case latitude = "lat"
		case longitude = "lng"
	}
}
